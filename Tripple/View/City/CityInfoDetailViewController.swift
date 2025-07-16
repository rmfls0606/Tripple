//
//  CityInfoDetailViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit
import Kingfisher

class CityInfoDetailViewController: UIViewController {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityEnglishNameLabel: UILabel!
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var cityExplainLabel: UILabel!
    
    var city: City = City(city_name: "-", city_english_name: "-", city_explain: "설명이 없습니다.", city_image: "", domestic_travel: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configure()
    }
    
    func configure(){
        if let image_url = URL(string: city.city_image){
            cityImageView.kf.setImage(with: image_url)
        }else{
            cityImageView.backgroundColor = .systemGray6
        }
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 10
        cityImageView.clipsToBounds = true
        
        cityNameLabel.text = "도시 이름 : " + city.city_name
        cityNameLabel.font = .systemFont(ofSize: 16)
        
        cityEnglishNameLabel.text = "영어 도시 이름 : " + city.city_english_name
        cityEnglishNameLabel.font = .systemFont(ofSize: 16)
        
        cityCountryLabel.text = "여행지 : " + (city.domestic_travel ? "국내" : "국외")
        cityCountryLabel.font = .systemFont(ofSize: 16)

        cityExplainLabel.text = "설명 : " + city.city_explain
        cityExplainLabel.font = .systemFont(ofSize: 16)
    }
}
