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
    private var filteredData = CityInfo().city
    
    var inputText: String = ""
    
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
        let spacing = 16.0
        let dimension = (UIScreen.main.bounds.width - (padding * 2) - spacing) / 2
        layout.itemSize = CGSize(width: dimension, height: dimension * 1.4)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(
            top: 8,
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
        
        cell.configure(city: cityInfoData[indexPath.row])
        cell.cityImageView.layer.cornerRadius = cell.bounds.width / 2
        cell.cityImageView.clipsToBounds = true
        
        
        return cell
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            filteredData = CityInfo().city
        case 1:
            filteredData = CityInfo().city.filter{$0.domestic_travel}
        default:
            filteredData = CityInfo().city.filter{!$0.domestic_travel}
        }
        cityInfoData = filteredData
        cityInfoCollectionView.reloadData()
    }
    
    @IBAction func cityInputTextFieldReturn(_ sender: UITextField) {
        guard let text = sender.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            inputText = ""
            cityInfoData = filteredData
            cityInfoCollectionView.reloadData()
            return
        }
        
        inputText = text
        cityInfoData = filteredData
            .filter{
                $0.city_name
                    .contains(text) || $0.city_english_name
                    .lowercased()
                    .contains(text) || $0.city_explain.contains(text)
            }
        
        cityInfoCollectionView.reloadData()
    }
    
    
    @IBAction func cityInputTextFieldChanged(_ sender: UITextField) {
        guard let text = sender.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            inputText = ""
            cityInfoData = filteredData
            cityInfoCollectionView.reloadData()
            return
        }
        
        inputText = text
        cityInfoData = filteredData
            .filter{
                $0.city_name
                    .contains(text) || $0.city_english_name
                    .lowercased()
                    .contains(text) || $0.city_explain.contains(text)
            }

        cityInfoCollectionView.reloadData()
    }
}
