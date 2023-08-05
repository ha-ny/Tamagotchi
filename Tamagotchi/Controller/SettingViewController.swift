//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class SettingViewController: UIViewController{

    @IBOutlet var settingTableView: UITableView!
    
    static let identifier = "SettingViewController"
    
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
        return InfoTamagotchi.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data = InfoTamagotchi.menuList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewControllerCell")!
        cell.imageView?.image = data.image
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.detail
        cell.detailTextLabel?.textColor = InfoTamagotchi.boldFontColor
        cell.tintColor = InfoTamagotchi.boldFontColor
        cell.backgroundColor = InfoTamagotchi.backColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch InfoTamagotchi.menuList[indexPath.row].swichFunc{
        case .changeName: changeName()
        case .pickViewShow: pickViewShow()
        case .alertDateReset: alertDateReset()
        }
    }
}

extension SettingViewController{
    
    func changeName(){
        let vc = storyboard?.instantiateViewController(identifier: ChangeNameViewController.identifier) as! ChangeNameViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pickViewShow(){

        let sb = UIStoryboard(name: "Pick", bundle: nil)
        let vc = sb.instantiateViewController(identifier: PickViewController.identifier) as! PickViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func alertDateReset(){
      
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancle)
        present(alert, animated: true)
        
        //데이터 초기화하기!
    }
}

extension SettingViewController{
    
    func designSetting(){
        view.backgroundColor = InfoTamagotchi.backColor
        
        navigationController?.navigationBar.tintColor = InfoTamagotchi.boldFontColor
        navigationController?.navigationBar.topItem?.title = ""
        
        settingTableView.backgroundColor = InfoTamagotchi.backColor
        settingTableView.layer.borderColor = InfoTamagotchi.boldFontColor.cgColor
    }
}
