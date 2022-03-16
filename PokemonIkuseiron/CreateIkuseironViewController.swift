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
    
    @IBOutlet weak var createIkuseironNavigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        createIkuseironNavigationBar.delegate = self
        
        // EurekaのフォームFuncを呼び出している
        createIkuseironForm()
        
        // ikuseironという定数に取得したデータを代入している
        let ikuseiron: Ikuseiron? = read()
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
            <<< NameRow("name") { row in
                row.title = "ポケモン名"
                row.tag = "name"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Name")
            }
        
            <<< NameRow("seikaku") { row in
                row.title = "性格"
                row.tag = "seikaku"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Seikaku")
            }
        
            <<< NameRow("tokusei") { row in
                row.title = "特性"
                row.tag = "tokusei"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Tokusei")
            }
        
            <<< NameRow("doryokuchi") { row in
                row.title = "努力値配分"
                row.tag = "doryokuchi"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Doryokuchi")
            }
        
            <<< NameRow("kotaichi") { row in
                row.title = "理想個体値"
                row.tag = "kotaichi"
                row.placeholder = "HP: 0 / 攻撃: 0 / 防御: 0 / 特攻: 0 / 特防: 0 / 素早さ: 0"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Kotaichi")
            }
        
            <<< NameRow("item") { row in
                row.title = "持ち物"
                row.tag = "item"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Item")
            }
        
            <<< NameRow("moves") { row in
                row.title = "覚えさせる技"
                row.tag = "moves"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Moves")
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
                    
                    // 画面を元の場所に戻す
                    self.dismiss(animated: true, completion: nil)
                    
                    // フォームに書かれたname(ポケモンの名前)を取得
                    let titleRow = form.rowBy(tag: "title") as! TextRow
                    let title: String = titleRow.value!
                    // データを取得、なければ新しく作成し保存
                    let ikuseiron: Ikuseiron? = read()
                    
                    // メモの新規作成、更新の条件分岐
                    if ikuseiron != nil {
                        // 更新
                        try! realm.write {
                            ikuseiron!.title = title
                        }
                    } else {
                        // 新規作成
                        let newIkuseiron = Ikuseiron()
                        newIkuseiron.title = title
                        
                        // Realmに新しくデータベースを追加する
                        try! realm.write {
                            realm.add(newIkuseiron)
                        }
                    }
                    
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
