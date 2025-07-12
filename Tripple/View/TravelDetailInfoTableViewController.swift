//
//  TravelDetailInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit

class TravelDetailInfoTableViewController: UITableViewController {

    private var travelInfoData: [Travel] = TravelInfo().travel
    
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
        
        let travel: Travel = travelInfoData[indexPath.row]
        
        cell.configure(travel: travel)
        cell.likeButton.tag = indexPath.row
        
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    private func likeButtonClicked(_ sender: UIButton){
        travelInfoData[sender.tag].like?.toggle()
        tableView.reloadData()
    }
}
