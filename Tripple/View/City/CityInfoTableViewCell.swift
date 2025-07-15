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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityNameLabel.textAlignment = .right
        
        cityImageView.contentMode = .scaleAspectFill
        
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.backgroundColor = .gray
        cityExplainLabel.layer.opacity = 0.3
    }
    
    func configure(city: City){
        if let image_url = URL(string: city.city_image){
            cityImageView.kf.setImage(with: image_url)
        }else{
            cityImageView.backgroundColor = .systemGray4
        }
        cityNameLabel.text = city.city_name
        cityExplainLabel.text = city.city_explain
    }
}
