//
//  AboutEventViewController.swift
//  EventGetTogether
//
//  Created by N on 01/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class AboutEventViewController: UIViewController {
    
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var eventStartTimeLabel: UILabel!
    @IBOutlet weak var eventEndTimeLabel: UILabel!
    @IBOutlet weak var timeInformationView: UIView!
    
    @IBOutlet weak var organizerLabel: UILabel!
    @IBOutlet weak var nameOrganizerLabel: UILabel!
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var hallLabel: UILabel!
    @IBOutlet weak var nameHallLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusConfirmationLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var discriptionView: UIView!
    
    @IBOutlet weak var changeDateViewButton: UIButton!
    @IBOutlet weak var cancelEventViewButton: UIButton!
    
    @IBOutlet weak var fullView: UIView!
    
    @IBAction func changeDateButton(_ sender: Any) {
    }
    
    @IBAction func cancelEventButton(_ sender: Any) {
    }
    
    var resultAboutEventID: ServerCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)
        
        backgroundFontCorner()
        
        self.navigationItem.title = "Мероприятие"
        
        if let startEvent = self.resultAboutEventID?.startDate {
            let time = Date(timeIntervalSince1970: TimeInterval(startEvent))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            DispatchQueue.main.async {
                self.eventStartTimeLabel.text = dateFormatter.string(from: time)
            }
        }
        
        if let endEvent = self.resultAboutEventID?.endDate {
            let time = Date(timeIntervalSince1970: TimeInterval(endEvent))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            DispatchQueue.main.async {
                self.eventEndTimeLabel.text = dateFormatter.string(from: time)
            }
        }
        
        if let nameAuthor = self.resultAboutEventID?.authorName {
            DispatchQueue.main.async {
                self.nameOrganizerLabel.text = nameAuthor
            }
        }
        
        if let dateEvent = self.resultAboutEventID?.startDate {
            let date = Date(timeIntervalSince1970: TimeInterval(dateEvent))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM yyyy"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            DispatchQueue.main.async {
                self.eventDateLabel.text = dateFormatter.string(from: date)
            }
        }
        
        if let phoneNumber = self.resultAboutEventID?.authorPhone {
            DispatchQueue.main.async {
                self.phoneNumberLabel.text = phoneNumber
            }
        }
        
        if let hall = self.resultAboutEventID?.room {
            DispatchQueue.main.async {
                self.nameHallLabel.text = hall
            }
        }
        
        if let status = self.resultAboutEventID?.statusString {
            DispatchQueue.main.async {
                self.statusConfirmationLabel.text = status
            }
        }
        
        if let description = self.resultAboutEventID?.description {
            DispatchQueue.main.async {
                self.discriptionLabel.text = description
            }
        }
        
    }
    
    func backgroundFontCorner() {
        
        fullView?.clipsToBounds = true
        fullView!.layer.cornerRadius = 6
        timeInformationView.backgroundColor = UIColor(red: 0.18,  green: 0.56, blue: 0.96, alpha:1)
        
        durationTimeLabel.textColor = UIColor.white
        eventStartTimeLabel.textColor = UIColor.white
        eventEndTimeLabel.textColor = UIColor.white
        
        discriptionView.backgroundColor = UIColor(red:0.19, green:0.19, blue:0.19, alpha:1)
        
        organizerLabel.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1)
        whenLabel.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1)
        hallLabel.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1)
        phoneLabel.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1)
        statusLabel.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1)
        nameOrganizerLabel.textColor = UIColor.white
        eventDateLabel.textColor = UIColor.white
        nameHallLabel.textColor = UIColor.white
        phoneNumberLabel.textColor = UIColor.white
        statusConfirmationLabel.textColor = UIColor.white
        discriptionLabel.textColor = UIColor.white
        
        
        changeDateViewButton.backgroundColor = UIColor(red:0.18, green:0.56, blue:0.96, alpha:1)
        changeDateViewButton?.clipsToBounds = true
        changeDateViewButton!.layer.cornerRadius = 6
        
        cancelEventViewButton.backgroundColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1)
        cancelEventViewButton?.clipsToBounds = true
        cancelEventViewButton!.layer.cornerRadius = 6
    }

}
