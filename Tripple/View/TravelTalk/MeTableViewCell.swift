//
//  MeTableViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/20/25.
//

import UIKit

class MeTableViewCell: UITableViewCell {
    
    @IBOutlet var contentBorderView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "MeTableViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentBorderView.layer.cornerRadius = contentBorderView.bounds.height / 4
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView(){
        contentBorderView.layer.borderWidth = 1.0
        contentBorderView.layer.borderColor = UIColor.systemGray.cgColor
        contentBorderView.backgroundColor = .systemGray4
        
        contentLabel.font = .systemFont(ofSize: 12)
        contentLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .systemGray
        
        selectionStyle = .none
    }
    
    func configureData(chat: Chat?){
        contentLabel.text = chat?.message
    }
}
