//
//  Ikuseiron.swift
//  PokemonIkuseiron
//
//  Created by 中村蒼 on 2022/03/15.
//

import Foundation
import RealmSwift

class Ikuseiron: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var seikaku: String = ""
    @objc dynamic var tokusei: String = ""
    @objc dynamic var doryokuchi: String = ""
    @objc dynamic var kotaichi: String = ""
    @objc dynamic var item: String = ""
    @objc dynamic var moves: String = ""
    
    @objc dynamic var rule: String = ""
    
    @objc dynamic var title: String = ""
    @objc dynamic var kousatu: String = ""
}
