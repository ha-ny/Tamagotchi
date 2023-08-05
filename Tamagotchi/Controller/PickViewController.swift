//
//  PickViewController.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class PickViewController: UIViewController {
    
    @IBOutlet var pickCollectionView: UICollectionView!
    
    let identifierCell = "PickCollectionViewCell"
    let identifierPopupView = "PopupViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: identifierCell, bundle: nil)
        pickCollectionView.register(nib, forCellWithReuseIdentifier: identifierCell)
        
        title = "다마고치 선택하기"
        pickCollectionView.delegate = self
        pickCollectionView.dataSource = self
        designController()
    }
}


extension PickViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pickCollectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! PickCollectionViewCell
        cell.settingView(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = InfoTamagotchi().characterTamagotchi[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: identifierPopupView) as! PopupViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.pop_Image = data.image
        vc.pop_Name = data.name
        vc.pop_Introduce = data.introduce + "\n레벨이 오를 수록 성장하는 걸 볼 수 있어\n10레벨이 되면 어른이 된거야"
        present(vc, animated: true)
    }
}

extension PickViewController{

    func designController(){
        view.backgroundColor = InfoTamagotchi().backColor

        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 2.5)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        pickCollectionView.collectionViewLayout = layout
        pickCollectionView.backgroundColor = InfoTamagotchi().backColor
    }
}
