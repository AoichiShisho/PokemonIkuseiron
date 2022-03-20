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
    
    var ikuseiron: Ikuseiron!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        detailViewNavigationBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleText.text = ikuseiron.title
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
