//
//  ExtensionView.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/13.
//

import UIKit

@IBDesignable
class EatButton: UIButton{

    @IBInspectable
    var borderWidth: CGFloat {
        get{ return layer.borderWidth }
        set{ layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get{ return layer.cornerRadius }
        set{ layer.cornerRadius = newValue }
    }
}

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
