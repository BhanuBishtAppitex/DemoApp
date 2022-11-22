//
//  CustomCell.swift
//  Demo
//
//  Created by wOOx Technology on 21/11/22.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier: String = "CellForMessagesPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var imageText: UILabel!
    @IBOutlet weak var videoIcon: UIImageView!
    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageIcon.image = UIImage(named: "ImageIcon")?.withRenderingMode(.alwaysTemplate)
        videoIcon.image = UIImage(named: "VideoIcon")?.withRenderingMode(.alwaysTemplate)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderColor = UIColor.clear.cgColor
        profileImage.layer.borderWidth = 1
        NSLayoutConstraint.activate([
            //mainView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-32),
            //mainView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
    }
    
}
