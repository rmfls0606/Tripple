//
//  TravelDetailInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit

class TravelDetailInfoTableViewController: UITableViewController {

    private let travelInfoData: [Travel] = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        self.navigationItem.title = "도시 상세 정보"
        self.navigationItem.largeTitleDisplayMode = .inline
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "travelDetailInfoTableViewCell",
            for: indexPath
        ) as? TravelDetailInfoTableViewCell else{
            return UITableViewCell()
        }
        
        
        return cell
    }
}
