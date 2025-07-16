//
//  CityInfoViewController.swift
//  Tripple
//
//  Created by 이상민 on 7/16/25.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let cityInfoData: [City] = CityInfo().city
    var filterData: [City] = CityInfo().city
    var cachedData: [City] = CityInfo().city
    
    @IBOutlet var cityInputTextField: UITextField!
    @IBOutlet var cityInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
    }
    
    func configure(){
        navigationItem.title = "인기 도시"
        navigationItem.largeTitleDisplayMode = .inline
        
        let xib = UINib(nibName: "CityInfoTableViewCell", bundle: nil)
        cityInfoTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        cityInfoTableView.delegate = self
        cityInfoTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as? CityInfoTableViewCell else {
            return UITableViewCell()
        }
        
        let city = filterData[indexPath.row]
        cell.configure(city: city)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(identifier: "CityInfoDetailViewController") as? CityInfoDetailViewController else{ return }
        
        viewController.city = cityInfoData[indexPath.row]
        
        present(viewController, animated: true)
    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            filterData = cityInfoData
            cachedData = cityInfoData
        case 1:
            filterData = cityInfoData.filter{$0.domestic_travel}
            cachedData = cityInfoData.filter{$0.domestic_travel}
        default:
            filterData = cityInfoData.filter{!$0.domestic_travel}
            cachedData = cityInfoData.filter{!$0.domestic_travel}
        }
        
        cityInfoTableView.reloadData()
    }
    
    @IBAction func cityInputTextFieldReturn(_ sender: UITextField) {
        guard let text = sender.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            filterData = cachedData
            cityInfoTableView.reloadData()
            return
        }
        
        filterData = cachedData.filter{ $0.city_name == text || $0.city_english_name.lowercased() == text.lowercased()}
        
        cityInfoTableView.reloadData()
    }
    
    
    @IBAction func cityInputTextFieldChanged(_ sender: UITextField) {
        guard let text = sender.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            filterData = cachedData
            cityInfoTableView.reloadData()
            return
        }
        
        filterData = cachedData.filter{ $0.city_name.contains(text) || $0.city_english_name.lowercased().contains(text)}
        print(filterData.map{$0.city_name})
        cityInfoTableView.reloadData()
    }
}
