//
//  FourthViewController.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import UIKit
import Alamofire

class FourthViewController: UIViewController {
    
    var weatherAPI = WeatherAPICall()
    var apiCall = DemoAPICall()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldText: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherAPI.delegate = self
        apiCall.delegate = self
    }
    
   
    

}

//MARK: - TextField delegate methods
extension FourthViewController: UITextFieldDelegate, WeatherAPIDelegate {
    
    // searchbutton's action
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        textField.endEditing(true)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let _ = textField.text {
            //weatherAPI.getRequestWithAlamofire(url: WeatherAPICall.url, parameters: ["q":textField.text!])
            apiCall.getRequestWithAlamofire(url: WeatherAPICall.url, parameters: ["q":textField.text!], model:  ModelForFourthViewController.self)
        }
    }
    
    
    func didUpdateWeather(weatherData: ModelForFourthViewController) {
        print("did update")
        self.updateWeatherLabel(data: weatherData)
    }
    
    func didFailWithError(error: Error) {
        print("did failed")
        self.textFieldText.text = "invalid entery!!"
        self.currentTempLabel.text = "na"
        self.descriptionLabel.text = "na"
        self.maxTempLabel.text = "na"
    }
    
    func updateWeatherLabel(data: ModelForFourthViewController){
        self.currentTempLabel.text = String(data.main.temp)
        self.descriptionLabel.text = String(data.main.temp_max)
        self.maxTempLabel.text = String(data.weather[0].description)
        self.textFieldText.text = String("\(data.name) : \(data.sys.country)")
       
    }
}
