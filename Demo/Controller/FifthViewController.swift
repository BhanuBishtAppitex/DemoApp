//
//  FifthViewController.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import UIKit

class FifthViewController: UIViewController {
    let nib: UINib = CellForWeatherData.nib
    let identifier: String = CellForWeatherData.identifier
    let data = WeatherData.model

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}


extension FifthViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForWeatherData
        let index = indexPath.section
        let newData = data[index]
        cell.nameLabel.text = newData.name
        cell.countryLabel.text = newData.sys.country
        cell.descriptionLabel.text = newData.weather[0].description
        cell.humidityLabel.text = "\(newData.main.humidity)"
        cell.sunriseLabel.text = "\(newData.sys.sunrise)"
        cell.sunsetLabel.text = "\(newData.sys.sunset)"
        cell.tempLabel.text = "\(newData.main.temp)"
        cell.windSpeedLabel.text = "\(newData.wind.speed)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}
