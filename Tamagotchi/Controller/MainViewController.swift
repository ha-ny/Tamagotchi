//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var bubbleImageView: UIImageView!

    let identifierSettingView = "SettingViewController"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        designSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let name = UserDefaults.standard.string(forKey: "name")!
        title = "\(name)의 다마고치"
    }
    
    @objc func profileButtonClick(){
        let vc = storyboard?.instantiateViewController(identifier: identifierSettingView) as! SettingViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController{
    
    func designSetting(){
        
        view.backgroundColor = InfoTamagotchi().backColor
        bubbleImageView.image = UIImage(named: "bubble")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButtonClick))
        navigationItem.rightBarButtonItem?.tintColor = InfoTamagotchi().boldFontColor
    }
}
