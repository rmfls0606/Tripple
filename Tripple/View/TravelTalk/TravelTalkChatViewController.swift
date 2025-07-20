//
//  TravelTalkChatViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/20/25.
//

import UIKit

class TravelTalkChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var inputMessageTextField: UITextField!
    @IBOutlet var messageSendButton: UIButton!
    
    var chatData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureData()
        chatTableView.separatorStyle = .none
    }
    
    private func configure(){
        inputMessageTextField.backgroundColor = .systemGray6
        inputMessageTextField.placeholder = "메세지를 입력하세요"
        inputMessageTextField.borderStyle = .roundedRect
        inputMessageTextField.rightView = UIView(
            frame: CGRect(x: 0, y: 0, width: 44, height: 44)
        )
        inputMessageTextField.rightViewMode = .always
        
        let image = UIImage(systemName: "paperplane")?.withTintColor(
            .systemGray2,
            renderingMode: .alwaysOriginal
        )
        messageSendButton.setImage(image, for: .normal)
        messageSendButton.setTitle("", for: .normal)
        
        let otherPersonXib = UINib(nibName: "OtherPersonTableViewCell", bundle: nil)
        chatTableView
            .register(
                otherPersonXib,
                forCellReuseIdentifier: OtherPersonTableViewCell.identifier
            )
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    private func configureData(){
        navigationItem.title = chatData?.chatroomName ?? "알 수 없음"
        navigationItem.largeTitleDisplayMode = .inline
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData?.chatList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: OtherPersonTableViewCell.identifier,
            for: indexPath
        ) as? OtherPersonTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
