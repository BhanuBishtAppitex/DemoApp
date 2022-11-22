//
//  CellForWeatherData.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import UIKit

class CellForWeatherData: UITableViewCell {
    
    static let identifier: String = "CelForWeatherData"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        mainView.layer.shadowRadius = 8
        mainView.layer.shadowOffset = CGSize(width: 4, height: 4)
        mainView.layer.shadowColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1).cgColor
        mainView.layer.shadowOpacity = 1
    }
    
}
