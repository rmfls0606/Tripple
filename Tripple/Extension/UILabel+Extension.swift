//
//  UILabel+Extension.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit

extension UILabel{
    func asColr(targetString: String){
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText.lowercased() as NSString).range(of: targetString)
        attributedString.addAttributes([.foregroundColor: UIColor.green], range: range)
        self.attributedText = attributedString
    }
}
