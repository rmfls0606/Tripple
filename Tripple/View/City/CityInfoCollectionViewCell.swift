//
//  CityInfoCollectionViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/17/25.
//

import UIKit

class CityInfoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cityImageView.contentMode = .scaleAspectFill
//        cityImageView.backgroundColor = .systemGray6
        
        cityNameLabel.font = .boldSystemFont(ofSize: 16)
        cityNameLabel.numberOfLines = 2
        
        cityExplainLabel.font = .systemFont(ofSize: 14)
        cityExplainLabel.textColor = .systemGray2
        cityExplainLabel.numberOfLines = 2
    }

    func configure(city: City){
        if let url = URL(string: city.city_image){
            cityImageView.kf.setImage(with: url)
        }
        
        cityNameLabel.text = city.city_name + " | " + city.city_english_name
        cityExplainLabel.text = city.city_explain
    }
}
