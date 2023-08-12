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

    override func viewDidLoad(){
        super.viewDidLoad()
        designSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let name = UserDefaults.standard.string(forKey: InfoTamagotchi.UserDefaultsKey.name.rawValue){
            title = "\(name)님의 다마고치"
        }
        
        ricerEat()
        waterEat()
    }

    @IBAction func riceEatButtonClick(_ sender: UIButton) {
        eatButtonClick(kind: InfoTamagotchi.UserDefaultsKey.rice.rawValue)
        riceTextField.text = ""
    }
    
    @IBAction func waterEatButtonClick(_ sender: UIButton) {
        eatButtonClick(kind: InfoTamagotchi.UserDefaultsKey.water.rawValue)
        waterTextField.text = ""
    }
    
    func eatButtonClick(kind: String){

        var num = 0
        
        if kind == InfoTamagotchi.UserDefaultsKey.rice.rawValue{
            num = Int(riceTextField.text ?? "") ?? 1
            
            if num < 100{
                ricerEat(newRice: num)
                return
            }
        }else{
            num = Int(waterTextField.text ?? "") ?? 1
            
            if num < 59{
                waterEat(newWater: num)
                return
            }
        }
        
        let alert = UIAlertController(title: "알림", message: "\(kind == InfoTamagotchi.UserDefaultsKey.rice.rawValue ? "밥알" : "물방울")이 너무 많아요...우웩", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }

    @objc func profileButtonClick(){
        guard let vc = storyboard?.instantiateViewController(identifier: SettingViewController.identifier) as? SettingViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func keyboardDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}

extension MainViewController{
    
    func characterSetting(characterLevel: Int){
        if let characterName = UserDefaults.standard.string(forKey: InfoTamagotchi.UserDefaultsKey.character.rawValue){
            for (index, Tamagotchi) in TamagotchiCharacterSetting.characterTamagotchi.enumerated(){
                if Tamagotchi.name == characterName{
                    characterImageView.image = UIImage(named: "\(index + 1)-\(characterLevel == 10 ? 9 : characterLevel)")
                    characterNameLabel.text = Tamagotchi.name
                }
            }
        }
    }
    
    func ricerEat(newRice: Int = 0){
        var rice = UserDefaults.standard.integer(forKey: InfoTamagotchi.UserDefaultsKey.rice.rawValue)
        rice += newRice
        UserDefaults.standard.set(rice, forKey: InfoTamagotchi.UserDefaultsKey.rice.rawValue)
    }
    
    func waterEat(newWater: Int = 0){
        var water = UserDefaults.standard.integer(forKey: InfoTamagotchi.UserDefaultsKey.water.rawValue)
        water += newWater
        UserDefaults.standard.set(water, forKey: InfoTamagotchi.UserDefaultsKey.water.rawValue)
    }
    func levelSetting(riceData: Int?, waterData: Int?){

        let rice = riceData ??  UserDefaults.standard.integer(forKey: InfoTamagotchi.UserDefaultsKey.rice.rawValue)
        let water = waterData ??  UserDefaults.standard.integer(forKey: InfoTamagotchi.UserDefaultsKey.water.rawValue)

        var level = ((rice/5)+(water/2)) / 10
        
        if level < 1{
            level = 1
        }else if level > 10{
            level = 10
        }
        
        characterSetting(characterLevel: level)
        characterDataLabel.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(water)개 "
        messageLabel.text = TamagotchiCharacterSetting.tamagotchiSay()
    }
    
    func designSetting(){
    
        view.backgroundColor = .backColor
        bubbleImageView.image = UIImage(named: "bubble")
        riceTextField.placeholder = "밥주세용"
        waterTextField.placeholder = "물주세용"
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        riceEatButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterEatButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        riceEatButton.setTitleColor(.boldFontColor, for: .normal)
        waterEatButton.setTitleColor(.boldFontColor, for: .normal)
        riceEatButton.setTitleColor(.boldFontColor, for: .highlighted)
        waterEatButton.setTitleColor(.boldFontColor, for: .highlighted)
        riceEatButton.tintColor = .boldFontColor
        waterEatButton.tintColor = .boldFontColor
        riceEatButton.setTitle("밥먹기", for: .normal)
        waterEatButton.setTitle("물먹기", for: .normal)
        riceEatButton.layer.borderColor = UIColor.boldFontColor.cgColor
        waterEatButton.layer.borderColor = UIColor.boldFontColor.cgColor
        riceEatButton.layer.borderWidth = 0.5
        waterEatButton.layer.borderWidth = 0.5
        riceEatButton.layer.cornerRadius = 5
        waterEatButton.layer.cornerRadius = 5
        characterNameLabel.textColor = .boldFontColor
        characterNameLabel.layer.borderColor = UIColor.boldFontColor.cgColor
        characterNameLabel.layer.borderWidth = 0.5
        characterNameLabel.layer.cornerRadius = 5
        characterDataLabel.textColor = .boldFontColor
        riceEatButton.titleLabel?.textColor = .boldFontColor
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButtonClick))
        navigationItem.rightBarButtonItem?.tintColor = .boldFontColor
    }
}
