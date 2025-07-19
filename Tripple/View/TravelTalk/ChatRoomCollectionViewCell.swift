//
//  ChatRoomCollectionViewCell.swift
//  Tripple
//
//  Created by 이상민 on 7/19/25.
//

import UIKit

class ChatRoomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChatRoomCollectionViewCell"
    
    @IBOutlet var chatImageView: UIImageView!
    @IBOutlet var chatTitleLabel: UILabel!
    @IBOutlet var chatContentLabel: UILabel!
    @IBOutlet var chatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView(){
        chatImageView.backgroundColor = .gray
        
        chatContentLabel.numberOfLines = 2
        
        chatDateLabel.font = .systemFont(ofSize: 10)
    }

}
