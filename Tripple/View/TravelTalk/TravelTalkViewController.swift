//
//  TravelTalkViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/19/25.
//

import UIKit

class TravelTalkViewController: UIViewController {


    @IBOutlet var travelTalkSearchBar: UISearchBar!
    @IBOutlet var travelTalkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure(){
        navigationItem.title = "TRAVEL TALK"
        navigationItem.largeTitleDisplayMode = .inline
        
        travelTalkSearchBar.placeholder = "친구 이름을 검색해보세요"
        travelTalkSearchBar.searchBarStyle = .minimal
    }
}
