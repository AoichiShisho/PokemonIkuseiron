//
//  CreateIkuseironViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/09.
//

import UIKit
import Eureka
import FirebaseFirestore
import RealmSwift

class CreateIkuseironViewController: FormViewController, UINavigationBarDelegate {
    
    var userDefault = UserDefaults.standard
    let firestore = Firestore.firestore()
    
    let realm = try! Realm()
    var list: List<Ikuseiron>!
    
    @IBOutlet weak var createIkuseironNavigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        createIkuseironNavigationBar.delegate = self
        
        // EurekaのフォームFuncを呼び出している
        createIkuseironForm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        list = realm.objects(IkuseironList.self).first?.list
    }
    
    // Ikuseironオブジェクトから最初(first)のデータを取り出している
    func read() -> Ikuseiron? {
        return realm.objects(Ikuseiron.self).first
    }
    
    // これによってNavigationBarを上につなげてる
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func createIkuseironForm() {
        form
            +++ Section("基本情報")
            <<< TextRow("name") { row in
                row.title = "ポケモン名"
                row.tag = "name"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Name")
            }
        
            <<< TextRow("seikaku") { row in
                row.title = "性格"
                row.tag = "seikaku"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Seikaku")
            }
        
            <<< TextRow("tokusei") { row in
                row.title = "特性"
                row.tag = "tokusei"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Tokusei")
            }
        
            <<< TextRow("doryokuchi") { row in
                row.title = "努力値配分"
                row.tag = "doryokuchi"
                row.placeholder = "HP: 0 / 攻撃: 0 / 防御: 0 / 特攻: 0 / 特防: 0 / 素早さ: 0"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Doryokuchi")
            }
        
            <<< TextRow("item") { row in
                row.title = "持ち物"
                row.tag = "item"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Item")
            }
        
            <<< TextRow("moves") { row in
                row.title = "覚えさせる技"
                row.tag = "moves"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Moves")
            }
        
            <<< ActionSheetRow<String>("dynamax") { row in
                row.title = "ダイナマックス"
                row.tag = "dynamax"
                row.selectorTitle = "ダイナマックスの有無"
                row.options = ["する","しない"]
            } .onChange { [unowned self] row in
                self.userDefault.setValue(row.value, forKey: "Rule")
            }
        
        
            +++ Section("対戦形式")
            <<< ActionSheetRow<String>("rule") { row in
                row.title = "対戦形式・ルール"
                row.tag = "rule"
                row.selectorTitle = "ルールを選択"
                row.options = ["シングルバトル","ダブルバトル"]
            } .onChange { [unowned self] row in
                self.userDefault.setValue(row.value, forKey: "Rule")
            }
        
        
            +++ Section("育成論の考察")
            <<< TextRow("title") { row in
                row.title = "タイトル"
                row.tag = "title"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Title")
            }
        
            <<< TextAreaRow("kousatu") { row in
                row.title = "考察"
                row.tag = "kousatu"
                row.placeholder = "考察を入力してください"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Kousatu")
            }
        
            
        
            +++ Section("")
            <<< ButtonRow("Save") { row in
                row.title = "投稿"
                row.tag = "save"
                
                // 投稿ボタンを押した時の処理
                row.onCellSelection {[unowned self] ButtonCellOf, row in
                    let ikuseiron = Ikuseiron()
                    
                    let nameRow = form.rowBy(tag: "name") as! TextRow
                    let seikakuRow = form.rowBy(tag: "seikaku") as! TextRow
                    let tokuseiRow = form.rowBy(tag: "tokusei") as! TextRow
                    let doryokuchiRow = form.rowBy(tag: "doryokuchi") as! TextRow
                    let itemRow = form.rowBy(tag: "item") as! TextRow
                    let movesRow = form.rowBy(tag: "moves") as! TextRow
                    let dynamaxRow = form.rowBy(tag: "dynamax") as! ActionSheetRow<String>
                    let ruleRow = form.rowBy(tag: "rule") as! ActionSheetRow<String>
                    let titleRow = form.rowBy(tag: "title") as! TextRow
                    let kousatuRow = form.rowBy(tag: "kousatu") as! TextAreaRow
                    
                    let name: String = nameRow.value!
                    let seikaku: String = seikakuRow.value!
                    let tokusei: String = tokuseiRow.value!
                    let doryokuchi: String = doryokuchiRow.value!
                    let item: String = itemRow.value!
                    let moves: String = movesRow.value!
                    let dynamax: String = dynamaxRow.value!
                    let rule: String = ruleRow.value!
                    let title: String = titleRow.value!
                    let kousatu: String = kousatuRow.value!
                    
                    ikuseiron.name = name
                    ikuseiron.seikaku = seikaku
                    ikuseiron.tokusei = tokusei
                    ikuseiron.doryokuchi = doryokuchi
                    ikuseiron.item = item
                    ikuseiron.moves = moves
                    ikuseiron.dynamax = dynamax
                    ikuseiron.rule = rule
                    ikuseiron.title = title
                    ikuseiron.kousatu = kousatu
                    
                    // データを取得、なければ新しく作成し保存
                    try! self.realm.write() {
                        if self.list == nil {
                            
                            let ikuseironList = IkuseironList()
                            ikuseironList.list.append(ikuseiron)
                            self.realm.add(ikuseironList)
                            self.list = self.realm.objects(IkuseironList.self).first?.list
                        } else {
                            self.list.append(ikuseiron)
                        }
                    }
                    
                    // 画面を元の場所に戻す(which is not working)
                    self.dismiss(animated: true, completion: nil)
                    
                    // 保存したアラートを表示
                    let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
                    alert.addAction(
                        UIAlertAction(title: "OK", style: .default, handler: nil)
                    )
                    
                    present(alert, animated: true, completion: nil)
                }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
