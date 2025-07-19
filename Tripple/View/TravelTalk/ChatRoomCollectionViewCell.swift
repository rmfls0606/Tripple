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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        chatImageView.layer.cornerRadius = chatImageView.bounds.width / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView(){
        chatImageView.backgroundColor = .gray
        chatImageView.contentMode = .scaleAspectFill
        
        chatTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        chatContentLabel.numberOfLines = 2
        chatContentLabel.font = .systemFont(ofSize: 12)
        chatContentLabel.textColor = .systemGray
        
        chatDateLabel.font = .systemFont(ofSize: 10)
    }

    func configureData(list: ChatRoom){
        guard let chat = list.chatList.last else { return }
        
        chatImageView.image = UIImage(named: list.chatroomImage)
        
        let user = chat.user
        chatTitleLabel.text = user.name
        chatContentLabel.text = chat.message
    }
    
}
