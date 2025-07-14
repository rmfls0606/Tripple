//
//  MagazineTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/11/25.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var magazineTitleLabel: UILabel!
    @IBOutlet weak var magazineContentLabel: UILabel!
    @IBOutlet weak var magazineDateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        
        magazineTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        magazineTitleLabel.numberOfLines = 2
        
        magazineContentLabel.font = .systemFont(ofSize: 14)
        magazineContentLabel.textColor = .systemGray2
        
        magazineDateLabel.font = .systemFont(ofSize: 12)
        magazineDateLabel.textAlignment = .right
        magazineDateLabel.textColor = .systemGray2
        
        self.selectionStyle = .none
    }
    
    func configure(magazine: Magazine){
        if let image_url = URL(string: magazine.photo_image){
            posterImageView.kf.setImage(with: image_url)
        }else{
            posterImageView.image = nil
            posterImageView.backgroundColor = .systemGray4
        }
        
        magazineTitleLabel.text = magazine.title
        magazineContentLabel.text = magazine.subtitle
        magazineDateLabel.text = magazine.date
        
        dateFormatter.dateFormat = "yyMMdd"
        let dateString = dateFormatter.date(from: magazine.date)
        
        if let date = dateString{
            dateFormatter.dateFormat = "yy년 MM월 dd일"
            magazineDateLabel.text = dateFormatter.string(from: date)
        }else{
            magazineDateLabel.text = "알 수 없음"
        }
    }
}
