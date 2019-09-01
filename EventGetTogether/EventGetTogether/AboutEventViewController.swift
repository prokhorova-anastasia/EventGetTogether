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
    
    @IBAction func changeDateButton(_ sender: Any) {
    }
    
    @IBAction func cancelEventButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundFontCorner()
        
        self.navigationItem.title = "Мероприятие"
        
    }
    
    func backgroundFontCorner() {
        timeInformationView.backgroundColor = UIColor(red: 0.18,  green: 0.56, blue: 0.96, alpha:1)
        timeInformationView?.clipsToBounds = true
        timeInformationView!.layer.cornerRadius = 6
        durationTimeLabel.textColor = UIColor.white
        eventStartTimeLabel.textColor = UIColor.white
        eventEndTimeLabel.textColor = UIColor.white
        
        discriptionView.backgroundColor = UIColor(red:0.19, green:0.19, blue:0.19, alpha:1)
        discriptionView?.clipsToBounds = true
        discriptionView!.layer.cornerRadius = 6
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
