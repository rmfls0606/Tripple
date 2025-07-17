//
//  CityInfoCollectionViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/17/25.
//

import UIKit

class CityInfoCollectionViewController: UIViewController {

    @IBOutlet var cityInputTextField: UITextField!
    @IBOutlet var cityInfoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        navigationItem.title = "인기 도시"
        navigationItem.largeTitleDisplayMode = .inline
        
        cityInputTextField.placeholder = "도시를 입력해주세요..."
    }
}
