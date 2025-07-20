//
//  TravelTalkViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/19/25.
//

import UIKit

class TravelTalkViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var travelTalkSearchBar: UISearchBar!
    @IBOutlet var travelTalkCollectionView: UICollectionView!
    
    private let dateFormatter = DateFormatter()
    
    private let chatList = ChatList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure(){
        navigationItem.title = "TRAVEL TALK"
        navigationItem.largeTitleDisplayMode = .inline
        
        travelTalkSearchBar.placeholder = "친구 이름을 검색해보세요"
        travelTalkSearchBar.searchBarStyle = .minimal
        
        let xib = UINib(nibName: "ChatRoomCollectionViewCell", bundle: nil)
        travelTalkCollectionView
            .register(
                xib,
                forCellWithReuseIdentifier: ChatRoomCollectionViewCell.identifier
            )
        travelTalkCollectionView.delegate = self
        travelTalkCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: deviceWidth, height: 80)
        
        travelTalkCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatRoomCollectionViewCell.identifier,
            for: indexPath
        ) as? ChatRoomCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        let list = chatList[indexPath.item]
        cell.configureData(list: list)
        cell.chatDateLabel.text = chatListDate(
            chatDate: list.chatList.last?.date
        )
        
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let storyboard = UIStoryboard(name: "TravelTalk", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "TravelTalkChatViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func chatListDate(chatDate: String?) -> String{
        guard let chatDate = chatDate else {
            return "-"
        }
        
        dateFormatter.dateFormat = "yy-MM-dd HH:mm"
        let date = dateFormatter.date(from: chatDate)
        
        guard let date = date else {
            return "-"
        }
        
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: date)
    }
}
