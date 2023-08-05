//
//  InfoTamagotchi.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

//Tamagotchi 프로젝트 Info
struct InfoTamagotchi{
    
    let backColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let boldFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    struct DataTamagotchi{
        let name: String
        let image: UIImage
        let introduce: String
    }
    
    let characterTamagotchi = [
        DataTamagotchi(name: "따끔따끔 다마고치", image: UIImage(named: "1-6")!, introduce: "\n나는 따끔따끔 다마고치!\n날 데려가"),
        DataTamagotchi(name: "방실방실 다마고치", image: UIImage(named: "2-6")!, introduce: "\n나는 방실방실 다마고치!\n배고파..."),
        DataTamagotchi(name: "반짝반짝 다마고치", image: UIImage(named: "3-6")!, introduce: "\n나는 반짝반짝 다마고치!\n물과 밥만 있으면 돼")
    ]
    
    enum SwichFunc{
        case changeName
        case pickViewShow
        case alertDateReset
    }
    
    struct DataMenu{
        let image: UIImage
        let title: String
        let detail: String?
        let swichFunc: SwichFunc
    }
    
    let menuList = [
        DataMenu(image: UIImage(systemName: "pencil")!, title: "내 이름 설정하기", detail: UserDefaults.standard.string(forKey: "name"), swichFunc: .changeName),
        DataMenu(image: UIImage(systemName: "moon.fill")!, title: "다마고치 변경하기", detail: nil, swichFunc: .pickViewShow),
        DataMenu(image: UIImage(systemName: "arrow.clockwise")!, title: "데이터 초기화", detail: nil, swichFunc: .alertDateReset)
    ]
}
