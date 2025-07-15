//
//  CityInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit

class CityInfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        navigationItem.title = "인기 도시"
        navigationItem.largeTitleDisplayMode = .inline
    }
}
