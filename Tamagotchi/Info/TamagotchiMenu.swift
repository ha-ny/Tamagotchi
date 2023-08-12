//
//  TamagotchiMenu.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/13.
//

import UIKit

struct TamagotchiMenu {
    
    enum SwichFunc {
        case changeName
        case pickViewShow
        case alertDateReset
    }

    struct DataMenu {
        let image: UIImage
        let title: String
        let detail: String?
        let swichFunc: SwichFunc
    }

    static let menuList = [
        DataMenu(image: UIImage(systemName: "pencil")!, title: "내 이름 설정하기", detail: InfoTamagotchi.UserDefaultsKey.name.rawValue, swichFunc: .changeName),
        DataMenu(image: UIImage(systemName: "moon.fill")!, title: "다마고치 변경하기", detail: nil, swichFunc: .pickViewShow),
        DataMenu(image: UIImage(systemName: "arrow.clockwise")!, title: "데이터 초기화", detail: nil, swichFunc: .alertDateReset)
    ]
}

