//
//  MagazineTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/11/25.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        self.navigationItem.title = "SeSAC TRAVEL"
        self.navigationItem.largeTitleDisplayMode = .inline
    }
}
