//
//  Game369ViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit

class Game369ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberTextField: UITextField!
    @IBOutlet weak var clap369ResultTextView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        inputNumberTextField.layer.borderWidth = 2.0
        inputNumberTextField.layer.borderColor = UIColor.systemGray2.cgColor
        inputNumberTextField.placeholder = "최대 숫자를 입력해주세요"
        inputNumberTextField.textAlignment = .center
        inputNumberTextField.font = UIFont.systemFont(ofSize: 20)
        
        clap369ResultTextView.text = "3,6,9 게임을 시작합니다."
        clap369ResultTextView.textColor = .systemGray3
        clap369ResultTextView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        clap369ResultTextView.isEditable = false
        clap369ResultTextView.textAlignment = .center
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        resultLabel.numberOfLines = 0
    }
    
    @IBAction func inputNumberTextFieldReturn(_ sender: UITextField) {
        view.endEditing(true)
        
        guard let text = sender.text, !text.isEmpty else{
            self.clap369ResultTextView.text = "입력하신 숫자가 존재하지 않습니다."
            self.resultLabel.text = ""
            return
        }
        
        guard let intText = Int(text) else{
            self.clap369ResultTextView.text = "잘못된 형식의 입력입니다. 숫자를 입력해주세요."
            self.resultLabel.text = ""
            return
        }
        
        var clapResult: [String] = []
        var clapResultString: String = ""
        var clapCnt: Int = 0
        
        for num in 1...intText{
            let digitArr = String(num).map{$0}
            var digitResult: String = ""
            for digit in digitArr{
                if ["3","6","9"].contains(digit){
                    digitResult += "👏"
                    clapCnt += 1
                    continue
                }
                digitResult += String(digit)
            }
            clapResult.append(digitResult)
        }
        
        clapResultString = clapResult.joined(separator: ", ")
        clap369ResultTextView.text = clapResultString
        resultLabel.text = "숫자 \(intText)까지 총 박수는 \(clapCnt)번 입니다."
    }
}
