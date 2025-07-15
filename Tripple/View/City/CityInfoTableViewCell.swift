//
//  CityInfoTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit

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
        cityExplainLabel.backgroundColor = .black
        cityExplainLabel.layer.opacity = 0.3
    }
}
