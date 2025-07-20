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
        
        configureView()
    }
    
    private func configureView(){
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = .systemGray4
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        contentBorderView.layer.borderWidth = 1.0
        contentBorderView.layer.borderColor = UIColor.systemGray.cgColor
        contentBorderView.layer.cornerRadius = 10
        
        contentLabel.font = .systemFont(ofSize: 12)
        contentLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .systemGray
        
        selectionStyle = .none
    }
    
    func configureData(chat: Chat?){
        if let imageName = chat?.user.image{
            profileImageView.image = UIImage(named: imageName)
        }
        
        nameLabel.text = chat?.user.name ?? "알 수 없음"
        contentLabel.text = chat?.message
    }
}
