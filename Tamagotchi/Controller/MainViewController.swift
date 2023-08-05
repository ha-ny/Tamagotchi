//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var bubbleImageView: UIImageView!
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterDataLabel: UILabel!
    @IBOutlet var riceTextField: UITextField!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var riceEatButton: UIButton!
    @IBOutlet var waterEatButton: UIButton!
    
    static let identifier = "MainViewController"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        designSetting()
        
        characterImageView.image = InfoTamagotchi.characterTamagotchi[0].image
        messageLabel.text = "밥은 드셨나요??\n저두 배고파요.."
        characterNameLabel.text = InfoTamagotchi.characterTamagotchi[0].name
        characterDataLabel.text = "LV1 · 밥알 0개 · 물방울 0개 "
        riceTextField.placeholder = "밥주세용"
        waterTextField.placeholder = "물주세용"
        riceEatButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterEatButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        riceEatButton.setTitle("밥먹기", for: .normal)
        waterEatButton.setTitle("물먹기", for: .normal)
        riceEatButton.layer.borderColor = InfoTamagotchi.boldFontColor.cgColor
        waterEatButton.layer.borderColor = InfoTamagotchi.boldFontColor.cgColor
        riceEatButton.layer.borderWidth = 0.5
        waterEatButton.layer.borderWidth = 0.5
        riceEatButton.layer.cornerRadius = 5
        waterEatButton.layer.cornerRadius = 5
        characterNameLabel.textColor = InfoTamagotchi.boldFontColor
        characterNameLabel.layer.borderColor = InfoTamagotchi.boldFontColor.cgColor
        characterNameLabel.layer.borderWidth = 0.5
        characterNameLabel.layer.cornerRadius = 5
        characterDataLabel.textColor = InfoTamagotchi.boldFontColor
        riceEatButton.titleLabel?.textColor = InfoTamagotchi.boldFontColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let name = UserDefaults.standard.string(forKey: "name")!
        title = "\(name)의 다마고치"
    }
    
    @objc func profileButtonClick(){
        let vc = storyboard?.instantiateViewController(identifier: SettingViewController.identifier) as! SettingViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController{
    
    func designSetting(){
        
        bubbleImageView.image = UIImage(named: "bubble")
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButtonClick))
        navigationItem.rightBarButtonItem?.tintColor = InfoTamagotchi.boldFontColor
    }
}
