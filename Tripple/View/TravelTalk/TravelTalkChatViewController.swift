//
//  TravelTalkChatViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/20/25.
//

import UIKit
import IQKeyboardManagerSwift

class TravelTalkChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet var chatInputView: UIView!
    @IBOutlet var chatEmptyLabel: UILabel!
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatInputTextView: UITextView!
    @IBOutlet var messageSendButton: UIButton!
    
    let dateFormatter = DateFormatter()
    
    var chatData: ChatRoom?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scrollToBottom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureData()
    }
    
    private func configure(){
        
        IQKeyboardManager.shared.isEnabled = true
        
        chatInputView.backgroundColor = .systemGray6
        chatInputView.clipsToBounds = true
        chatInputView.layer.cornerRadius = 10
        
        chatEmptyLabel.text = "메세지를 입력하세요"
        chatEmptyLabel.font = .systemFont(ofSize: 14)
        chatEmptyLabel.textColor = .systemGray2
        
        chatInputTextView.backgroundColor = .systemGray6
        chatInputTextView.text = ""
        chatInputTextView.font = .systemFont(ofSize: 14)
        chatInputTextView.textContainerInset = UIEdgeInsets(
            top: 10,
            left: 5,
            bottom: 10,
            right: 5
        )
        
        let image = UIImage(systemName: "paperplane")?.withTintColor(
            .systemGray2,
            renderingMode: .alwaysOriginal
        )
        messageSendButton.setImage(image, for: .normal)
        messageSendButton.setTitle("", for: .normal)
        messageSendButton.isEnabled = false
        
        let otherPersonXib = UINib(nibName: "OtherPersonTableViewCell", bundle: nil)
        chatTableView
            .register(
                otherPersonXib,
                forCellReuseIdentifier: OtherPersonTableViewCell.identifier
            )
        let meXib = UINib(nibName: "MeTableViewCell", bundle: nil)
        chatTableView
            .register(meXib, forCellReuseIdentifier: MeTableViewCell.identifier)
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatInputTextView.delegate = self
        
        chatTableView.separatorStyle = .none
        
        chatTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureData(){
        navigationItem.title = chatData?.chatroomName ?? "알 수 없음"
        navigationItem.largeTitleDisplayMode = .inline
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData?.chatList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if chatData?.chatList[indexPath.row].user != ChatList.me {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OtherPersonTableViewCell.identifier,
                for: indexPath
            ) as? OtherPersonTableViewCell else {
                return UITableViewCell()
            }
            cell.configureData(chat: chatData?.chatList[indexPath.row])
            cell.dateLabel.text = chatDate(
                chatDate: chatData?.chatList[indexPath.row].date
            )
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MeTableViewCell.identifier,
                for: indexPath
            ) as? MeTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureData(chat: chatData?.chatList[indexPath.row])
            cell.dateLabel.text = chatDate(
                chatDate: chatData?.chatList[indexPath.row].date
            )
            
            return cell
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        chatEmptyLabel.isHidden = true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text, !text
            .trimmingCharacters(in: .whitespaces).isEmpty else {
            messageSendButton.isEnabled = false
            
            chatInputView.constraints.forEach { constraint in
                if constraint.firstAttribute == .height {
                    constraint.constant = 36
                }
            }
            return
        }
        
        let lineHeight = textView.font?.lineHeight ?? 0
        let insets = textView.textContainerInset.top + textView.textContainerInset.bottom
        let maxLines = 3
        let maxHeight = lineHeight * CGFloat(maxLines) + insets

        let boundingSize = CGSize(width: textView.bounds.width, height: .infinity)
        let textHeight = textView.sizeThatFits(boundingSize).height
        
        chatInputView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = min(textHeight, maxHeight)
            }
        }
 
        textView.isScrollEnabled = textHeight > maxHeight
        
        messageSendButton.isEnabled = true
    }
    
    @IBAction func messageSendButtonClicked(_ sender: UIButton) {
        guard let text = chatInputTextView.text, !text
            .trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        view.endEditing(true)
        
        chatInputView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = 36
            }
        }
        
        dateFormatter.dateFormat = "yy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: Date())
        
        let chat = Chat(user: ChatList.me, date: dateString, message: text)
        chatData?.chatList.append(chat)
        chatEmptyLabel.isHidden = false
        chatInputTextView.text = ""
        messageSendButton.isEnabled = false
        chatTableView.reloadData()
        
        scrollToBottom()
    }
    
    @IBAction func viewTappedGesture(_ sender: UITapGestureRecognizer) {
        if let text = chatInputTextView.text, text
            .trimmingCharacters(in: .whitespaces).isEmpty{
            chatEmptyLabel.isHidden = false
        }
        view.endEditing(true)
    }
    
    private func chatDate(chatDate: String?) -> String{
        guard let chatDate = chatDate else {
            return "-"
        }
        
        dateFormatter.dateFormat = "yy-MM-dd HH:mm"
        let date = dateFormatter.date(from: chatDate)
        
        guard let date = date else {
            return "-"
        }
        
        dateFormatter.dateFormat = "HH:mm aa"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }

    private func scrollToBottom(){
        guard let chatData = chatData else { return }
        
        let indexPath = IndexPath(item: chatData.chatList.count - 1, section: 0)
        self.chatTableView
            .scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}
