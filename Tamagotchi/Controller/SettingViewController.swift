//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class SettingViewController: UIViewController{

    @IBOutlet var settingTableView: UITableView!
    
    let identifierSettingCell = "SettingViewControllerCell"
    let identifierChangeName = "ChangeNameViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
        title = "설정"
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingTableView.reloadData()
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoTamagotchi().menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data = InfoTamagotchi().menuList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierSettingCell)!
        cell.imageView?.image = data.image
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.detail
        cell.detailTextLabel?.textColor = InfoTamagotchi().boldFontColor
        cell.tintColor = InfoTamagotchi().boldFontColor
        cell.backgroundColor = InfoTamagotchi().backColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch InfoTamagotchi().menuList[indexPath.row].swichFunc{
        case .changeName: changeName()
        case .pickViewShow: pickViewShow()
        case .alertDateReset: alertDateReset()
        }
    }
}

extension SettingViewController{
    
    func changeName(){
        let vc = storyboard?.instantiateViewController(identifier: identifierChangeName) as! ChangeNameViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pickViewShow(){
        print(#function, "ddddddddddd")
    }
    
    func alertDateReset(){
        print(#function, "ddddddddddd")
    }
}

extension SettingViewController{
    
    func designSetting(){
        view.backgroundColor = InfoTamagotchi().backColor
        
        navigationController?.navigationBar.tintColor = InfoTamagotchi().boldFontColor
        navigationController?.navigationBar.topItem?.title = ""
        
        settingTableView.backgroundColor = InfoTamagotchi().backColor
        settingTableView.layer.borderColor = InfoTamagotchi().boldFontColor.cgColor
    }
}
