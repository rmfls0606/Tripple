//
//  TravelTalkChatViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/20/25.
//

import UIKit

class TravelTalkChatViewController: UIViewController {

    @IBOutlet var ChatTableView: UITableView!
    @IBOutlet var inputMessageTextField: UITextField!
    @IBOutlet var messageSendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
}
