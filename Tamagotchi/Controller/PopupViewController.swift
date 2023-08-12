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
        guard let vc = sb.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
        let nav = UINavigationController(rootViewController: vc)

        if !UserDefaults.standard.bool(forKey: InfoTamagotchi.UserDefaultsKey.isLaunched.rawValue){
            UserDefaults.standard.set(true, forKey: InfoTamagotchi.UserDefaultsKey.isLaunched.rawValue)
        }
        
        if let name = UserDefaults.standard.string(forKey: InfoTamagotchi.UserDefaultsKey.name.rawValue){
            UserDefaults.standard.set("대장", forKey: name)
        }
        
        UserDefaults.standard.set(pop_Name, forKey: InfoTamagotchi.UserDefaultsKey.character.rawValue)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}


extension PopupViewController{
    
    func designSetting(){
        
        view.layer.backgroundColor = (UIColor.white.cgColor).copy(alpha: 0.5)
        
        pop_View.backgroundColor = .backColor
        pop_View.layer.cornerRadius = 10
        pop_TextView.backgroundColor = .backColor
        pop_TextView.textColor = .boldFontColor
        pop_NameLabel.font = .systemFont(ofSize: 13)
        pop_NameLabel.font = .systemFont(ofSize: 13)
        pop_NameLabel.textColor = .boldFontColor
        pop_NameLabel.layer.borderWidth = 1
        pop_NameLabel.layer.borderColor = UIColor.boldFontColor.cgColor
        pop_NameLabel.layer.cornerRadius = 4
        pop_CancelButton.setTitle("취소", for: .normal)
        pop_CancelButton.setTitleColor(.boldFontColor, for: .normal)
        pop_CancelButton.setTitleColor(.darkGray, for: .highlighted)
        pop_CancelButton.backgroundColor = .systemGray5
        pop_OkButton.setTitle("입양", for: .normal)
        pop_OkButton.setTitleColor(.boldFontColor, for: .normal)
        pop_OkButton.setTitleColor(.darkGray, for: .highlighted)
    }
}
