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
        
        let data = TamagotchiCharacterSetting.characterTamagotchi[indexRow]
        pickNameLabel.text = data.name
        pickimageView.image = data.image
    }
    
    func designLabel(){

        pickNameLabel.font = .systemFont(ofSize: 13)
        pickNameLabel.layer.borderWidth = 1
        pickNameLabel.layer.borderColor = UIColor.boldFontColor.cgColor
        pickNameLabel.layer.cornerRadius = 4
        pickNameLabel.textColor = .boldFontColor
    }
}
