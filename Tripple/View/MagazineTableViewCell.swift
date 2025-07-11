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
    }
    
    func configure(magazine: Magazine){
        guard let image_url = URL(string: magazine.photo_image) else { return }
        posterImageView.kf.setImage(with: image_url)
        
        magazineTitleLabel.text = magazine.title
        magazineContentLabel.text = magazine.subtitle
        magazineDateLabel.text = magazine.date
        
    }
}
