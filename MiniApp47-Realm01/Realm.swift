//
//  Realm.swift
//  MiniApp47-Realm01
//
//  Created by 前田航汰 on 2022/04/24.
//

import Foundation
import RealmSwift

class User: Object {
  @objc dynamic var id = ""
  @objc dynamic var name = ""
}
