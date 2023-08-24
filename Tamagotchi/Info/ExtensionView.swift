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
    
    enum TransitionType {
        case present
        case presentNavigation
        case push
    }
    
    func transition<T: UIViewController>(sbName: String, view: T.Type, transitionType: TransitionType) {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: String(describing: view)) as? T else { return }
        
        switch transitionType {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
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
