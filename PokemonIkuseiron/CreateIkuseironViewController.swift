//
//  CreateIkuseironViewController.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/09.
//

import UIKit
import Eureka

class CreateIkuseironViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet weak var createIkuseironNavigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarの設定
        createIkuseironNavigationBar.delegate = self
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
