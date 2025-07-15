//
//  TravelAdDetailViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/15/25.
//

import UIKit

class TravelAdDetailViewController: UIViewController {

    @IBOutlet weak var adTextLabel: UILabel!
    
    var adText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        navigationItem.title = "광고 화면"
        navigationItem.largeTitleDisplayMode = .inline
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(dismissButtonClicked)
        )
        
        adTextLabel.text = adText ?? "광고 내용이 존재하지 않습니다."
        adTextLabel.textAlignment = .center
        adTextLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    @objc
    private func dismissButtonClicked(){
        dismiss(animated: true)
    }
}
