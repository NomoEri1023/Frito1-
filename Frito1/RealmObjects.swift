//
//  RealmObjects.swift
//  
//
//  Created by 野本エリカ on 2018/05/09.
//

import Foundation
import RealmSwift

class Shouhin: Object {
    @objc dynamic var name = ""
    @objc dynamic var float = 0
    @objc dynamic var id: Int = 1
    override static func primaryKey() -> String {
        return "id"
    }
    
}
