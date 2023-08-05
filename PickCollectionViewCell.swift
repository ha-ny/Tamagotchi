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
    
    static let identifier = "PickCollectionViewCell"
    
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
        
        let data = InfoTamagotchi.characterTamagotchi[indexRow]
        pickNameLabel.text = data.name
        pickimageView.image = data.image
    }
    
    func designLabel(){
        let boldFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        pickNameLabel.font = .systemFont(ofSize: 13)
        pickNameLabel.layer.borderWidth = 1
        pickNameLabel.layer.borderColor = boldFontColor.cgColor
        pickNameLabel.layer.cornerRadius = 4
        pickNameLabel.textColor = boldFontColor
    }
}
