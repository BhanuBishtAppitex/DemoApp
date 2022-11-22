//
//  SixthViewController.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import UIKit

class SixthViewController: UIViewController {
    
    var apiCall = DemoAPICall()
    var demo = Demo()
    @IBOutlet weak var maningLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall.delelgateTwo = self
        demo.delegate = self
    }
    

  
    
}


extension SixthViewController: UITextFieldDelegate, DictonaryAPIDelegate  {
    func update(data: Data) {
        print("update")
        //self.maningLabel.text = "\()"
    }
    
    func didUpdateData(data: ModelForSixthViewController) {
        print("didupdate")
        self.maningLabel.text = "\(data.meanings[0].definitions)"
    }
    
    func didFailWithError(error: Error) {
        print("failed")
        self.maningLabel.text = "Invalid Text"
    }
    
    
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
            print("inside didEndEditing")
           
            //weatherAPI.getRequestWithAlamofire(url: WeatherAPICall.url, parameters: ["q":textField.text!])
            let demo = Demo()
            demo.getRequestWithAlamofire()
        }
    }
    
    
}
