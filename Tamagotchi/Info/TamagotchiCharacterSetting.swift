//
//  TamagotchiCharacterSetting.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/13.
//

import UIKit

struct TamagotchiCharacterSetting{
    
    struct DataTamagotchi{
        let name: String
        let image: UIImage
        let introduce: String
    }
    
    static let characterTamagotchi = [
        DataTamagotchi(name: "따끔따끔 다마고치", image: UIImage(named: "1-6")!, introduce: "\n나는 따끔따끔 다마고치!\n날 데려가"),
        DataTamagotchi(name: "방실방실 다마고치", image: UIImage(named: "2-6")!, introduce: "\n나는 방실방실 다마고치!\n배고파..."),
        DataTamagotchi(name: "반짝반짝 다마고치", image: UIImage(named: "3-6")!, introduce: "\n나는 반짝반짝 다마고치!\n물과 밥만 있으면 돼")
    ]
    
    static func tamagotchiSay() -> String{
        if let name = UserDefaults.standard.string(forKey: InfoTamagotchi.UserDefaultsKey.name.rawValue){
            
            let messageTamagotchi = [
                "쉬고싶어요! \(name)님.. 살려주세요",
                "\(name)님 배고파요",
                "\(name)님 밥주세요!",
                "혹시 제가 뚱뚱해보세요? \(name)님을 보니 마음이 놓여요 ㅎ(조크)ㅎ",
                "\(name)님 저는 잘 자라고 있어요",
                "\(name)님 오늘도 좋은 하루 보내세요",
                "사실 저는 더러운 다마고치랍니다. \(name)님 샤워시설을 만들어주세요",
                "\(name)님 운동 하세요",
                "할 말이 없어요...\(name)님 저는 수줍은 다마고치인가봐요",
                "아직 배가 안고파요..\(name)님 많이 드세요"
            ]
            
            return messageTamagotchi.randomElement()!
        }
        
        return ""
    }
}
