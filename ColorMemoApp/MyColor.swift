//
//  MyColor.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/23.
//

import UIKit

struct MyColor {
    static let orange = UIColor.rgba(red: 248, green: 193, blue: 101, alpha: 1) // #f8c165
    static let red = UIColor.rgba(red: 210, green: 65, blue: 65, alpha: 1) // #d24141
    static let blue = UIColor.rgba(red: 65, green: 135, blue: 250, alpha: 1) // #4187fa
    static let pink = UIColor.rgba(red: 240, green: 100, blue: 185, alpha: 1) // #f064b9
    static let green = UIColor.rgba(red: 80, green: 170, blue: 65, alpha: 1) // #50aa41
    static let purple = UIColor.rgba(red: 150, green: 90, blue: 210, alpha: 1) // #965ad2
}

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
