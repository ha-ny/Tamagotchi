//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/05.
//

import UIKit

enum textCount: Error{
    case towOrMore
    case sixOrUnder
}

class ChangeNameViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
        title = "대장님 이름 정하기"
        nameTextField.becomeFirstResponder()
    }
    
    func errorCheck(_ nameText: String) throws -> String {
        guard nameText.count <= 6 else{ throw textCount.sixOrUnder }
        guard nameText.count >= 2 else{ throw textCount.towOrMore }
        
        return nameText
    }
    
    @objc func saveButtonClick(){
        
        do {
            let nameText = try errorCheck(nameTextField.text ?? "")
            
            UserDefaults.standard.set(nameText, forKey: InfoTamagotchi.UserDefaultsKey.name.rawValue)
            view.endEditing(true)
            alertShow(title: "성공", message: "\(nameText)\n다마고치는 기억력이 좋답니다", isExit: true)
        }
        catch {
            switch error{
            case textCount.towOrMore: alertShow(title: "알림", message: "2글자 이상 입력해주세요")
            case textCount.sixOrUnder: alertShow(title: "알림", message: "6글자 이하 입력해주세요")
            default:
                print("error")
            }
        }
    }

    @IBAction func endTextField(_ sender: UITextField) {
    }
}

extension ChangeNameViewController{
    
    func designSetting(){
        view.backgroundColor = .backColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClick))
        nameTextField.backgroundColor = .backColor
        nameTextField.textColor = .boldFontColor
        nameTextField.placeholder = "대장님의 이름이 궁금해요!"
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
