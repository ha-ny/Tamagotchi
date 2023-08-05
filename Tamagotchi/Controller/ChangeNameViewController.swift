//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/05.
//

import UIKit

class ChangeNameViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
        title = "대장님 이름 정하기"
        //TextField Foucs
        nameTextField.becomeFirstResponder()
    }
    
    @objc func saveButtonClick(){
        if  6 >= nameTextField.text!.count && nameTextField.text!.count >= 2{
            UserDefaults.standard.set(nameTextField.text, forKey: "name")
            view.endEditing(true)
            alertShow(title: "성공", message: "\(nameTextField.text!)\n다마고치는 기억력이 좋답니다", isExit: true)
        }else
        {
            alertShow(title: "알림", message: "이름은 2글자 이상 6글자 이하로 입력해주세요")
        }
    }
    
    
    
    @IBAction func endTextField(_ sender: UITextField) {
    }
}

extension ChangeNameViewController{
    
    func designSetting(){
        view.backgroundColor = InfoTamagotchi().backColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClick))
        navigationItem.rightBarButtonItem?.tintColor = InfoTamagotchi().boldFontColor
        navigationController?.navigationBar.tintColor = InfoTamagotchi().boldFontColor
        
        nameTextField.backgroundColor = InfoTamagotchi().backColor
        nameTextField.textColor = InfoTamagotchi().boldFontColor
        nameTextField.placeholder = "대장님의 새로운 이름이 궁금해요!"
    }
    
    func alertShow(title: String, message: String, isExit: Bool = false){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default){_ in
            if isExit{
                self.navigationController?.popViewController(animated: true)
            }
        }
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
