//
//  MemoData.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/18.
//

import Foundation

struct MemoData {
    var id: String = UUID().uuidString
    var text: String = ""
    var recordDate: Date = Date()
}
