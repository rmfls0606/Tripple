//
//  TravelDetailInfoTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit
import Kingfisher
import Cosmos

class TravelDetailInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var travelImageView: UIImageView!
    @IBOutlet weak var cosmosRatingview: CosmosView!
    private let numberFormatter = NumberFormatter()
    @IBOutlet weak var likeButton: UIButton!
    
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
        
        cosmosRatingview.settings.starSize = 15
        cosmosRatingview.settings.starMargin = 0
        cosmosRatingview.settings.textColor = .systemGray2
        cosmosRatingview.settings.textFont = .systemFont(ofSize: 12)
        cosmosRatingview.settings.updateOnTouch = false
        cosmosRatingview.settings.filledColor = .orange
        cosmosRatingview.settings.emptyColor = .systemGray5
        cosmosRatingview.settings.filledBorderColor = .orange
        cosmosRatingview.settings.emptyBorderColor = .systemGray5
        
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .white
    }
    
    func configure(travel: Travel){
        
        if let travel_image = travel.travel_image, let image_url = URL(string:  travel_image){
            travelImageView.kf.setImage(with: image_url)
        }else{
            travelImageView.image = nil
            travelImageView.backgroundColor = .systemGray4
        }
        
        titleLabel.text = travel.title ?? "알 수 없음"
        descriptionLabel.text = travel.description ?? "-"
        
        numberFormatter.numberStyle = .decimal
        let saveCount = numberFormatter.string(from: NSNumber(integerLiteral: travel.save ?? 0)) ?? "0"
        
        if let grade = travel.grade{
            cosmosRatingview.isHidden = false
            cosmosRatingview.rating = grade
            cosmosRatingview.text = "(\(grade)) · "
        }else{
            cosmosRatingview.isHidden = true
        }
        
        if let likeState = travel.like{
            likeButton.isHidden = false
            if likeState{
                likeButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), for: .normal)
            }else{
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }else{
            likeButton.isHidden = true
        }
        
        
        infoLabel.text = "저장 \(saveCount)"
    }
}
