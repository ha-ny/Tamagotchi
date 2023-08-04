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
    
    var pop_ImageName: String = ""
    var pop_Name: String = ""
    var pop_Introduce: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
        
        view.layer.backgroundColor =  (UIColor.white.cgColor).copy(alpha: 0.5)
        pop_ImageView.image = UIImage(named: pop_ImageName)
        pop_NameLabel.text = pop_Name
        pop_TextView.text = pop_Introduce
    }
    
    @IBAction func cancelButtonClick(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func okButtonClick(_ sender: UIButton) {
        //메인화면
    }
    
}


extension PopupViewController{
    
    func designSetting(){
        
        let backColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        let boldFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        pop_View.backgroundColor = backColor
        pop_View.layer.cornerRadius = 10
        pop_TextView.backgroundColor = backColor
        pop_TextView.textColor = boldFontColor
        pop_NameLabel.font = pop_NameLabel.font.withSize(13)
  
        
        pop_NameLabel.font = pop_NameLabel.font.withSize(14)
        pop_NameLabel.textColor = boldFontColor
        pop_NameLabel.layer.borderWidth = 1
        pop_NameLabel.layer.borderColor = boldFontColor.cgColor
        pop_NameLabel.layer.cornerRadius = 4
        
        pop_CancelButton.setTitle("취소", for: .normal)
        pop_CancelButton.setTitleColor(boldFontColor, for: .normal)
        pop_CancelButton.setTitleColor(.darkGray, for: .highlighted)
        pop_CancelButton.backgroundColor = .systemGray5
        pop_OkButton.setTitle("입양", for: .normal)
        pop_OkButton.setTitleColor(boldFontColor, for: .normal)
        pop_OkButton.setTitleColor(.darkGray, for: .highlighted)
    }
}
