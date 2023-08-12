//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class SettingViewController: UIViewController{

    @IBOutlet var settingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
        title = "설정"
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TamagotchiMenu.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data = TamagotchiMenu.menuList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewControllerCell")!
        cell.imageView?.image = data.image
        
        cell.textLabel?.text = data.title
        if let _ = data.detail{
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: InfoTamagotchi.UserDefaultsKey.name.rawValue)
        }else{
            cell.detailTextLabel?.text = ""
        }

        cell.detailTextLabel?.textColor = .boldFontColor
        cell.tintColor = .boldFontColor
        cell.backgroundColor = .backColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch TamagotchiMenu.menuList[indexPath.row].swichFunc{
        case .changeName: changeName()
        case .pickViewShow: pickViewShow()
        case .alertDateReset: alertDateReset()
        }
    }
}

extension SettingViewController{
    
    func changeName(){
        guard let vc = storyboard?.instantiateViewController(identifier: ChangeNameViewController.identifier) as? ChangeNameViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pickViewShow(){

        let sb = UIStoryboard(name: "Pick", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: PickViewController.identifier) as? PickViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func alertDateReset(){
      
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default){_ in
            self.okReset()
        }
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancle)
        present(alert, animated: true)
    }
    
    func okReset(){
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Pick", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: PickViewController.identifier) as? PickViewController else { return }
        let nav = UINavigationController(rootViewController: vc)

        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }

        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}

extension SettingViewController{
    
    func designSetting(){
        view.backgroundColor = .backColor
        
        navigationController?.navigationBar.tintColor = .boldFontColor
        navigationController?.navigationBar.topItem?.title = ""
        
        settingTableView.backgroundColor = .backColor
        settingTableView.layer.borderColor = UIColor.boldFontColor.cgColor
    }
}
