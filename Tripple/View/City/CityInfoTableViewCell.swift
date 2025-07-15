//
//  CityInfoTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit
import Kingfisher

class CityInfoTableViewCell: UITableViewCell {

    static let identifier = "CityInfoTableViewCell"
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityExplainLabel: UILabel!
    @IBOutlet weak var explainPaddingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityNameLabel.textAlignment = .right
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cityNameLabel.textColor = .white
        
        cityImageView.contentMode = .scaleAspectFill
        
        explainPaddingView.backgroundColor = .black
        explainPaddingView.layer.opacity = 0.7
        
        cityExplainLabel.textAlignment = .left
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 14)
    }
    
    func configure(city: City){
        if let image_url = URL(string: city.city_image){
            cityImageView.kf.setImage(with: image_url)
        }else{
            cityImageView.backgroundColor = .systemGray4
        }
        cityNameLabel.text = city.city_name + " | " + city.city_english_name
        cityExplainLabel.text = city.city_explain
    }
}
