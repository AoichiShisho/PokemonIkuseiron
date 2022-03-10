//
//  CreateIkuseironViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/09.
//

import UIKit
import Eureka

class CreateIkuseironViewController: FormViewController, UINavigationBarDelegate {
    @IBOutlet weak var createIkuseironNavigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        createIkuseironNavigationBar.delegate = self
        
        form
            +++ Section("基本情報")
            <<< NameRow("name") {
                $0.title = "ポケモン名"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("seikaku") {
                $0.title = "性格"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("tokusei") {
                $0.title = "特性"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("doryokuchi") {
                $0.title = "努力値配分"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("kotaichi") {
                $0.title = "理想個体値"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("item") {
                $0.title = "持ち物"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("moves") {
                $0.title = "覚えさせる技"
                $0.add(rule: RuleRequired())
            }
        
            +++ Section("対戦形式")
            <<< PickerInputRow<String>("rule") {
                $0.title = "対戦形式・ルール"
                $0.options = ["シングルバトル", "ダブルバトル"]
        }
        
            +++ Section("育成論の考察")
            <<< NameRow("title") {
                $0.title = "タイトル"
                $0.add(rule: RuleRequired())
            }
            <<< NameRow("kousatu") {
                $0.title = "考察"
                $0.add(rule: RuleRequired())
            }
    }
    
    // これによってNavigationBarを上につなげてる
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
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
