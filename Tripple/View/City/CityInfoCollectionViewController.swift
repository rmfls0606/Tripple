//
//  CityInfoCollectionViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/17/25.
//

import UIKit

class CityInfoCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var cityInputTextField: UITextField!
    @IBOutlet var cityInfoCollectionView: UICollectionView!
    
    private var cityInfoData = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        navigationItem.title = "인기 도시"
        navigationItem.largeTitleDisplayMode = .inline
        
        cityInputTextField.placeholder = "도시를 입력해주세요..."
        
        cityInfoCollectionView.delegate = self
        cityInfoCollectionView.dataSource = self
        
        let xib = UINib(nibName: "CityInfoCollectionViewCell", bundle: nil)
        cityInfoCollectionView.register(xib, forCellWithReuseIdentifier: "CityInfoCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        let padding = 16.0
        let spacing = 8.0
        let dimension = (UIScreen.main.bounds.width - (padding * 2) - spacing) / 2
        layout.itemSize = CGSize(width: dimension, height: dimension * 1.4)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: padding,
            bottom: spacing,
            right: padding
        )
        
        cityInfoCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfoData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CityInfoCollectionViewCell",
            for: indexPath
        ) as? CityInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
