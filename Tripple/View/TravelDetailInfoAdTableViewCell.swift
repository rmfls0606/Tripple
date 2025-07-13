//
//  TravelDetailInfoADTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/13/25.
//

import UIKit

class TravelDetailInfoAdTableViewCell: UITableViewCell {

    @IBOutlet weak var adBackgroundView: UIView!
    @IBOutlet weak var adTextLabel: UILabel!
    @IBOutlet weak var adTagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adBackgroundView.layer.cornerRadius = 10
        adBackgroundView.clipsToBounds = true
        
        adTextLabel.font = .systemFont(ofSize: 16, weight: .bold)
        adTextLabel.numberOfLines = 2
        adTextLabel.textAlignment = .center
        
        adTagLabel.text = "AD"
        adTagLabel.backgroundColor = .white
        adTagLabel.textAlignment = .center
        adTagLabel.layer.cornerRadius = 10
        adTagLabel.clipsToBounds = true
        
        self.selectionStyle = .none
    }
    
    func configure(travel: Travel, adColor: UIColor){
        adTextLabel.text = travel.title
        adBackgroundView.backgroundColor = adColor
    }
}
