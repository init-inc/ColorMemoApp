//
//  MemoData.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/18.
//

import Foundation
import RealmSwift

class MemoData: Object {
    var id: String = UUID().uuidString
    var text: String = ""
    var recordDate: Date = Date()
}
