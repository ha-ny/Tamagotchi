//
//  PickCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class PickCollectionViewCell: UICollectionViewCell {

    @IBOutlet var pickimageView: UIImageView!
    @IBOutlet var pickNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designLabel()
    }
    
    func settingView(_ indexRow: Int){
        
        guard indexRow < 3 else{
            pickNameLabel.text = "Sold Out"
            pickimageView.image = UIImage(named: "noImage")
            return
        }
        
        pickNameLabel.text =  characterTamagotchi[indexRow].name
        print(characterTamagotchi[indexRow].name)
        pickimageView.image = UIImage(named: characterTamagotchi[indexRow].imageName)
    }
    
    func designLabel(){
        let boldFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        pickNameLabel.font = pickNameLabel.font.withSize(13)
        pickNameLabel.layer.borderWidth = 1
        pickNameLabel.layer.borderColor = boldFontColor.cgColor
        pickNameLabel.layer.cornerRadius = 4
        pickNameLabel.textColor = boldFontColor
    }
}
