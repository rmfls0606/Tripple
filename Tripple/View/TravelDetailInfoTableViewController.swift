//
//  TravelDetailInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit

class TravelDetailInfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        self.navigationItem.title = "도시 상세 정보"
        self.navigationItem.largeTitleDisplayMode = .inline
    }
}
