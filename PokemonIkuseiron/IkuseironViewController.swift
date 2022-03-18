//
//  IkuseironViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/09.
//

import UIKit
import RealmSwift

class IkuseironViewController: UIViewController, UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ikuseironViewNavigationBar: UINavigationBar!
    
    @IBOutlet weak var ikuseironTableView: UITableView!
    
    let realm = try! Realm()
    var list: List<Ikuseiron>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Realmのデータを取得
        list = realm.objects(IkuseironList.self).first?.list
        
        // NavigationBarの設定
        ikuseironViewNavigationBar.delegate = self
        
        self.ikuseironTableView.delegate = self
        self.ikuseironTableView.dataSource = self
        
        addButton.layer.cornerRadius = 32
    }
    
    // tableviewの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return realm.objects(Ikuseiron.self).count
        return list.count
    }
    
    // 表示するCellの内容を変える
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].title
        return cell
    }
    
    // このメソッドは画面表示前のタイミングで呼ばれます。
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            loadView()
            viewDidLoad()// データの再読み込み
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
