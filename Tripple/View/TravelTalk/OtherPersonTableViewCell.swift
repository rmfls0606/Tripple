//
//  OtherPersonTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/20/25.
//

import UIKit

class OtherPersonTableViewCell: UITableViewCell {

    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentBorderView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "OtherPersonTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        contentBorderView.layer.borderWidth = 1.0
        contentBorderView.layer.borderColor = UIColor.systemGray.cgColor
        contentBorderView.layer.cornerRadius = contentBorderView.bounds.height / 4
        
        contentLabel.font = .systemFont(ofSize: 12)
        
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .systemGray
    }
}
