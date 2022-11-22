//
//  ThirdViewController.swift
//  Demo
//
//  Created by wOOx Technology on 21/11/22.
//

import UIKit
import Alamofire
import AlamofireImage

class ThirdViewController: UIViewController {
    
    private var isEnabled: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.backgroundColor = .systemOrange
        imageView.contentMode = .scaleAspectFit
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // step 1: request
        // step 2: responseImage
        AF.request("https://source.unsplash.com/user/c_v_r/1900x800").responseImage { response in
            // check for result
            switch response.result{
                // if success
            case .success(let image):
                    print("Success")
                    UIView.animate(withDuration: 2.0,
                               delay: 0.1,
                               usingSpringWithDamping: 0.3,
                               initialSpringVelocity: 0.5,
                               options: .curveEaseInOut) {
                        if self.isEnabled {
                            let scaledImage = image.af.imageScaled(to: CGSize(width: 400, height: 400)) //optional
                            let roundedImage = scaledImage.af.imageRounded(withCornerRadius: 50) //optional
                            self.imageView.image = roundedImage
                        
                        } else {
                            let scaledImage = image.af.imageScaled(to: CGSize(width: 400, height: 400)) // optional
                            let circularImage = scaledImage.af.imageRoundedIntoCircle() // optional
                            self.imageView.image = circularImage
                        }
                    } completion: { completed in
                            self.isEnabled.toggle()
                    }
                // if failure
            case .failure(_):
                return
            }
        }
    }
}
