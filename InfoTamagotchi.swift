//
//  InfoTamagotchi.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import Foundation

// struct InfoTamagotchi{
//
//
//
//}
struct DataTamagotchi{
    var name: String
    var imageName: String
    var introduce: String
}

let characterTamagotchi = [
    DataTamagotchi(name: "따끔따끔 다마고치", imageName: "1-6", introduce: "\n나는 따끔따끔 다마고치!\n날 데려가"),
    DataTamagotchi(name: "방실방실 다마고치", imageName: "2-6", introduce: "\n나는 방실방실 다마고치!\n배고파..."),
    DataTamagotchi(name: "반짝반짝 다마고치", imageName: "3-6", introduce: "\n나는 반짝반짝 다마고치!\n물과 밥만 있으면 돼")
]

//enum characterTamagotchi: Int {
//    case car
//    case bus
//    case taxi
//
//    var kind: String {
//        switch self {
//        case .car:
//            return "car"
//        case .bus:
//            return "bus"
//        case .taxi:
//            return "taxi"
//        }
//    }
//}
    
//enum characterTamagotchi: (String, Int){
//    typealias RawValue = Int
//
//    case sharp = ("따끔따끔 다마고치",0)
//    case smile = "방실방실 다마고치"
//    case twinkle = "반짝반짝 다마고치"
//}
//
//func characterReturn(_ character: characterTamagotchi){
//    switch character {
//    case 0: return (character.rawValue, "1-6")
//    case 1 return (character.rawValue, "1-6")
//    case 2 return (character.rawValue, "1-6")
//        <#code#>
//}
//
//
//struct InfoTamagotchi{
//
//
//    let character = [
//        ["따끔따끔 다마고치", "1-6"],
//        ["방실방실 다마고치", "2-6"],
//         ["반짝반짝 다마고치", "3-6"]
//    ]
//
//    func getLavel() -> Int{
//        return 0
//    }
//
//
//
//    struct DataTamagotchi{
//        var name: Tamagotchi
//        var level: Int
//        var rice: Int
//        var water: Int
//        var image: String
//    }
//
//
//    struct InfoTamagotchi{
//
//    //    let myTamagotchi: [DataTamagotchi] = [
//    //        DataTamagotchi(name: .sharp, level: 1, image: "1-1")
//    //    ]
//    }
//
//}
