//
//  TravelDetailInfoTableViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/12/25.
//

import UIKit

enum AdColor: CaseIterable{
    case pink, green
    
    var color: UIColor{
        switch self{
        case.pink:
            return UIColor.systemPink
        case .green:
            return UIColor.systemGreen
        }
    }
}

class TravelDetailInfoTableViewController: UITableViewController {
    
    private var travelInfoData: [Travel] = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        self.navigationItem.title = "도시 상세 정보"
        self.navigationItem.largeTitleDisplayMode = .inline
        
        let xib = UINib(nibName: "TravelDetailInfoTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelDetailInfoTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let showAd = travelInfoData[indexPath.row].ad
        
//        if !showAd{
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TravelDetailInfoTableViewCell",
                for: indexPath
            ) as? TravelDetailInfoTableViewCell else{
                return UITableViewCell()
            }
            
            let travel: Travel = travelInfoData[indexPath.row]
            
            cell.configure(travel: travel)
            cell.likeButton.tag = indexPath.row
            
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            
            return cell
//        }else{
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "travelDetailInfoAdTableViewCell", for: indexPath) as? TravelDetailInfoAdTableViewCell else{
//                return UITableViewCell()
//            }
//            
//            let travel: Travel = travelInfoData[indexPath.row]
//            let adColor = AdColor.allCases[indexPath.row % 2].color
//            cell.configure(travel: travel, adColor: adColor)
//            
//            return cell
//        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let showAd = travelInfoData[indexPath.row].ad
        
        if !showAd{
            return 160
        }else{
            return 80
        }
    }
    
    @objc
    private func likeButtonClicked(_ sender: UIButton){
        travelInfoData[sender.tag].like?.toggle()
        tableView.reloadData()
    }
}
