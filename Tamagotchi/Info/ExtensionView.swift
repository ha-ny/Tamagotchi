//
//  ExtensionView.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/13.
//

import UIKit

extension UIViewController{
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView{
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIColor {
    static let backColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    static let boldFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
}
