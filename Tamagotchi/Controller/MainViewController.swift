//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit
//riceTextField을
class MainViewController: UIViewController{

    let pickerViewList = Array(1...99)
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let name = UserDefaults.standard.string(forKey: "name")!
        title = "\(name)님의 다마고치"
        
        dataSetting()
    }

    @IBAction func riceEatButtonClick(_ sender: UIButton) {
        eatButtonClick(kind: "rice")
        riceTextField.text = ""
    }
    
    @IBAction func waterEatButtonClick(_ sender: UIButton) {
        eatButtonClick(kind: "water")
        waterTextField.text = ""
    }
    
    func eatButtonClick(kind: String){

        var num = 0
        
        if kind == "rice"{
            num = Int(riceTextField.text ?? "") ?? 1
            
            if num < 100{
                dataSetting(newRice: num)
                return
            }
        }else{
            num = Int(waterTextField.text ?? "") ?? 1
            
            if num < 59{
                dataSetting(newWater: num)
                return
            }
        }
        
        let alert = UIAlertController(title: "알림", message: "\(kind == "rice" ? "밥알" : "물방울")이 너무 많아요...우웩", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }

    @objc func profileButtonClick(){
        let vc = storyboard?.instantiateViewController(identifier: SettingViewController.identifier) as! SettingViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func keyboardDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}

extension MainViewController{
    
    func characterSetting(characterLevel: Int){
        let characterName = UserDefaults.standard.string(forKey: "character")!
        for (index, Tamagotchi) in InfoTamagotchi.characterTamagotchi.enumerated(){
            if Tamagotchi.name == characterName{
                characterImageView.image = UIImage(named: "\(index + 1)-\(characterLevel == 10 ? 9 : characterLevel)")
                characterNameLabel.text = Tamagotchi.name
            }
        }
    }
    
    func dataSetting(newRice: Int = 0, newWater: Int = 0){

        var rice = UserDefaults.standard.integer(forKey: "rice")
        var water = UserDefaults.standard.integer(forKey: "water")
        rice += newRice
        water += newWater
        
        UserDefaults.standard.set(rice, forKey: "rice")
        UserDefaults.standard.set(water, forKey: "water")

        var level = (rice/5)+(water/2) / 10
        
        if level < 1{
            level = 1
        }else if level > 10{
            level = 10
        }
        
        characterSetting(characterLevel: level)
        characterDataLabel.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개 "
        messageLabel.text = InfoTamagotchi().tamagotchiSay()
    }
    
    func designSetting(){
        
        view.backgroundColor = InfoTamagotchi.backColor
        bubbleImageView.image = UIImage(named: "bubble")
        riceTextField.placeholder = "밥주세용"
        waterTextField.placeholder = "물주세용"
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        riceEatButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterEatButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        riceEatButton.setTitleColor(InfoTamagotchi.boldFontColor, for: .normal)
        waterEatButton.setTitleColor(InfoTamagotchi.boldFontColor, for: .normal)
        riceEatButton.setTitleColor(InfoTamagotchi.boldFontColor, for: .highlighted)
        waterEatButton.setTitleColor(InfoTamagotchi.boldFontColor, for: .highlighted)
        riceEatButton.tintColor = InfoTamagotchi.boldFontColor
        waterEatButton.tintColor = InfoTamagotchi.boldFontColor
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
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButtonClick))
        navigationItem.rightBarButtonItem?.tintColor = InfoTamagotchi.boldFontColor
    }
}
