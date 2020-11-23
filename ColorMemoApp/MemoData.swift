//
//  MemoData.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/18.
//

import Foundation
import RealmSwift

class MemoData: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var text: String = ""
    @objc dynamic var recordDate: Date = Date()
}
