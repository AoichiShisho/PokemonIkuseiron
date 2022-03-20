//
//  DetailViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/19.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var detailViewNavigationBar: UINavigationBar!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var seikakuText: UILabel!
    @IBOutlet weak var tokuseiText: UILabel!
    @IBOutlet weak var doryokuchiText: UILabel!
    @IBOutlet weak var movesText: UILabel!
    @IBOutlet weak var itemText: UILabel!
    @IBOutlet weak var ruleText: UILabel!
    @IBOutlet weak var kousatuText: UILabel!
    
    @IBOutlet weak var seikakuView: UIView!
    @IBOutlet weak var tokuseiView: UIView!
    @IBOutlet weak var doryokuchiView: UIView!
    
    var ikuseiron: Ikuseiron!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        detailViewNavigationBar.delegate = self
        
        seikakuView.layer.borderWidth = 2.0
        tokuseiView.layer.borderWidth = 2.0
        doryokuchiView.layer.borderWidth = 2.0
        seikakuView.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        tokuseiView.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        doryokuchiView.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        seikakuView.layer.cornerRadius = 10
        tokuseiView.layer.cornerRadius = 10
        doryokuchiView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleText.text = ikuseiron.title
        nameText.text = ikuseiron.name
        seikakuText.text = ikuseiron.seikaku
        tokuseiText.text = ikuseiron.tokusei
        doryokuchiText.text = ikuseiron.doryokuchi
        movesText.text = ikuseiron.moves
        itemText.text = ikuseiron.item
        ruleText.text = ikuseiron.rule
        kousatuText.text = ikuseiron.kousatu
    }
    
    // NavigationBarを上につなげる
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
