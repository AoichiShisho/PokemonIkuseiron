//
//  CreateIkuseironViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/09.
//

import UIKit
import Eureka

class CreateIkuseironViewController: FormViewController, UINavigationBarDelegate {
    
    var userDefault = UserDefaults.standard
    
    @IBOutlet weak var createIkuseironNavigationBar: UINavigationBar!
    @IBOutlet weak var sendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        createIkuseironNavigationBar.delegate = self
        
        createIkuseironForm()
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
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Name")
            }
        
            <<< NameRow("seikaku") { row in
                row.title = "性格"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Seikaku")
            }
        
            <<< NameRow("tokusei") { row in
                row.title = "特性"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Tokusei")
            }
        
            <<< NameRow("doryokuchi") { row in
                row.title = "努力値配分"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Doryokuchi")
            }
        
            <<< NameRow("kotaichi") { row in
                row.title = "理想個体値"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Kotaichi")
            }
        
            <<< NameRow("item") { row in
                row.title = "持ち物"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Item")
            }
        
            <<< NameRow("moves") { row in
                row.title = "覚えさせる技"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Moves")
            }
        
        
            +++ Section("対戦形式")
            <<< ActionSheetRow<String>("rule") { row in
                row.title = "対戦形式・ルール"
                row.selectorTitle = "ペットを選択"
                row.options = ["シングルバトル","ダブルバトル"]
            } .onChange { [unowned self] row in
                self.userDefault.setValue(row.value, forKey: "Rule")
            }
        
        
            +++ Section("育成論の考察")
            <<< NameRow("title") { row in
                row.title = "タイトル"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Title")
            }
        
            <<< TextAreaRow("kousatu") { row in
                row.title = "考察"
                row.placeholder = "考察を入力してください"
                row.add(rule: RuleRequired())
            } .onChange { row in
                self.userDefault.setValue(row.value, forKey: "Kousatu")
            }
        
            
        
            +++ Section("")
            <<< ButtonRow("フォーム") { row in
                row.title = "投稿"
                row.onCellSelection {[unowned self] ButtonSelfOf, row in
                    //let object = NCMBObject(className: "Post")
                    //object?.setObject(NCMBUser.current(), forKey: "user")
                    //object?.setObject(self.userDefault.string(forKey: "Title"), forKey: "Title")
                    //object?.setObject(self.userDefault.string(forKey: "Memo"), forKey: "Memo")
                    //object?.setObject(self.userDefault.object(forKey: "Date")as! Date, forKey: "Date")
                    //object?.setObject(self.userDefault.string(forKey: "Satisfaction"), forKey: "Satisfaction")
                    //object?.saveInBackground({ (error) in
                    //    if error != nil{
                    //        print(error)
                    //    } else {
                    //        let alertController = UIAlertController(title: "投稿完了", message: "内容が投稿されました", preferredStyle: .alert)
                    //        let action = UIAlertAction(title: "確認", style: .default) { (action) in
                    //            self.navigationController?.popViewController(animated: true)
                    //        }
                    //        alertController.addAction(action)
                    //        self.present(alertController, animated: true, completion: nil)
                    //    }
                //})
            }
        }
    }
    
    @IBAction func sendForm() {
        self.dismiss(animated: true, completion: nil)
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
