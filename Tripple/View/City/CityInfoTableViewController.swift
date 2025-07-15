//
//  CityInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit

class CityInfoTableViewController: UITableViewController {

    let cityInfoData: [City] = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        navigationItem.title = "인기 도시"
        navigationItem.largeTitleDisplayMode = .inline
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as? CityInfoTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
