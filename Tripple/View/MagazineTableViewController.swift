//
//  MagazineTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/11/25.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    private let magazineData: [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        self.navigationItem.title = "SeSAC TRAVEL"
        self.navigationItem.largeTitleDisplayMode = .inline
        
        self.tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "magazineTableViewCell",
            for: indexPath
        ) as? MagazineTableViewCell else {
            return UITableViewCell()
        }
        
        let magazine = magazineData[indexPath.row]
        cell.configure(magazine: magazine)
        
        return cell
    }
}
