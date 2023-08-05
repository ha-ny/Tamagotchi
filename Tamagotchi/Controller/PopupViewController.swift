//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet var pop_View: UIView!
    @IBOutlet var pop_ImageView: UIImageView!
    @IBOutlet var pop_NameLabel: UILabel!
    @IBOutlet var pop_TextView: UITextView!
    @IBOutlet var pop_CancelButton: UIButton!
    @IBOutlet var pop_OkButton: UIButton!
    
    var pop_Image: UIImage!
    var pop_Name: String = ""
    var pop_Introduce: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()

        pop_ImageView.image = pop_Image
        pop_NameLabel.text = pop_Name
        pop_TextView.text = pop_Introduce
    }
    
    @IBAction func cancelButtonClick(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func okButtonClick(_ sender: UIButton) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "MainViewController") as! MainViewController
        let nav = UINavigationController(rootViewController: vc)

        if UserDefaults.standard.bool(forKey: "isLaunched") == false{
            UserDefaults.standard.set(true, forKey: "isLaunched")
        }
        
        if UserDefaults.standard.string(forKey: "name") == nil{
            UserDefaults.standard.set("대장님", forKey: "name")
        }

        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}


extension PopupViewController{
    
    func designSetting(){
        
        view.layer.backgroundColor = (UIColor.white.cgColor).copy(alpha: 0.5)
        
        pop_View.backgroundColor = InfoTamagotchi().backColor
        pop_View.layer.cornerRadius = 10
        pop_TextView.backgroundColor = InfoTamagotchi().backColor
        pop_TextView.textColor = InfoTamagotchi().boldFontColor
        pop_NameLabel.font = pop_NameLabel.font.withSize(13)
  
        
        pop_NameLabel.font = pop_NameLabel.font.withSize(14)
        pop_NameLabel.textColor = InfoTamagotchi().boldFontColor
        pop_NameLabel.layer.borderWidth = 1
        pop_NameLabel.layer.borderColor = InfoTamagotchi().boldFontColor.cgColor
        pop_NameLabel.layer.cornerRadius = 4
        
        pop_CancelButton.setTitle("취소", for: .normal)
        pop_CancelButton.setTitleColor(InfoTamagotchi().boldFontColor, for: .normal)
        pop_CancelButton.setTitleColor(.darkGray, for: .highlighted)
        pop_CancelButton.backgroundColor = .systemGray5
        pop_OkButton.setTitle("입양", for: .normal)
        pop_OkButton.setTitleColor(InfoTamagotchi().boldFontColor, for: .normal)
        pop_OkButton.setTitleColor(.darkGray, for: .highlighted)
    }
}
