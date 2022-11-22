//
//  ViewController.swift
//  Demo
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit
import Kingfisher
import SnapKit
import ViewAnimator
import SearchTextField
import Lottie

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 100))]
    
    let nib = CustomCell.nib
    let identifier = CustomCell.identifier
    let data = ModelForMessagesPage.self
    
    
    private var isActive: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.isHidden = false
        UIView.animate(views: tableView.visibleCells, animations: animations, reversed: false,
                            initialAlpha: 1.0, finalAlpha: 0.0, completion: {
                 self.tableView.reloadData()
            self.tableView.isHidden = false
             })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
        
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        //let fromAnimation = AnimationType.from(direction: .right, offset: 100.0)
        //let zoomAnimation = AnimationType.zoom(scale: 2.2)
        //let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            if self.isActive {
                self.tableView.isHidden = false
                UIView.animate(views: self.tableView.visibleCells, animations: self.animations,initialAlpha: 1.0, finalAlpha: 0.0, completion: {
                    self.isActive.toggle()
                      })
            } else {
                self.isActive.toggle()
                
                UIView.animate(views: self.tableView.visibleCells, animations: self.animations, reversed: true,
                                    initialAlpha: 1.0, finalAlpha: 0.0, completion: {
                    self.tableView.reloadData()
                    self.tableView.isHidden = true
                     })
            }
        }

        
        
        
        
        
    }
}



//MARK: - tableview extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.profileImage.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell for messagesTableView
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomCell
        
        // cell view
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.125).cgColor
        cell.layer.shadowRadius = 8
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        
        let index = indexPath.section
        cell.profileImage.image = UIImage(named: data.profileImage[index])
        cell.nameLabel.text = data.nameText[index]
        
        // cell selection View
        let view = UIView()
        view.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = view
        
        
        if data.isSeen[index] {
            switch data.lastMessage[index] {
            case LastMessage.Text:
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.messageLabel.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.messageLabel.text = data.messagesText[index]
            case LastMessage.Image:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            case LastMessage.Video:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden =  false
                cell.videoLabel.isHidden = false
                cell.videoIcon.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.videoLabel.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            }
            cell.timeLabel.isHidden = true
            cell.notificationLabel.isHidden = true
            cell.notificationView.isHidden = true
            
            
        } else {
            switch data.lastMessage[index] {
            case LastMessage.Text:
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.text = data.messagesText[index]
            case LastMessage.Image:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            case LastMessage.Video:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden =  false
                cell.videoLabel.isHidden = false
                cell.videoIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            }
            if data.timeText[index] != "na" {
                cell.timeLabel.isHidden = false
                cell.timeLabel.text = data.timeText[index]
            }
            if data.notificationText[index] != "na" {
                cell.notificationLabel.isHidden = false
                cell.notificationLabel.text = data.notificationText[index]
            }
        }
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    
    
    
  
}

