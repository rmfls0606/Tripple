//
//  TravelDetailInfoTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit
import Kingfisher

class TravelDetailInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var travelImageView: UIImageView!
    
    private let numberFormatter = NumberFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.text = ""
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.numberOfLines = 2
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 2
        
        infoLabel.font = .systemFont(ofSize: 12)
        infoLabel.textColor = .systemGray2
        
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
        travelImageView.clipsToBounds = true
    }
    
    func configure(travel: Travel){
        
        if let travel_image = travel.travel_image, let image_url = URL(string:  travel_image){
            travelImageView.kf.setImage(with: image_url)
        }else{
            travelImageView.backgroundColor = .systemGray4
        }
        
        titleLabel.text = travel.title ?? "알 수 없음"
        descriptionLabel.text = travel.description ?? "-"
        
        numberFormatter.numberStyle = .decimal
        let saveCount = numberFormatter.string(from: NSNumber(integerLiteral: travel.save ?? 0)) ?? "0"
        
        infoLabel.text = "평점(\(travel.grade ?? 0.0)) · 저장 \(saveCount)"
    }
}
