//
//  TravelDetailViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/15/25.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreCityButton: UIButton!
    
    var city: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure(){
        
        navigationItem.title = "관광지 화면"
        navigationItem.largeTitleDisplayMode = .inline
        
        if let travel_image = city?.travel_image, let image_url = URL(
            string: travel_image
        ){
            cityImageView.kf.setImage(with: image_url)
        }else{
            cityImageView.backgroundColor = .gray
        }
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 10
        cityImageView.clipsToBounds = true
        
        titleLabel.text = city?.title ?? "-"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
        descriptionLabel.text = city?.description ?? "-"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 2
        
        var config = UIButton.Configuration.filled()
        config.title = "다른 관광지 보러 가기"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .blue
        config.cornerStyle = .capsule
        config.titlePadding = 50
        
        moreCityButton.configuration = config
    }
    
    @IBAction func moreCityButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
