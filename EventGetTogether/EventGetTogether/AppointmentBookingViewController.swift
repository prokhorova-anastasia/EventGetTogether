//
//  AppointmentBookingViewController.swift
//  EventGetTogether
//
//  Created by N on 01/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class AppointmentBookingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseHallTableViewCell", for: indexPath) as? ChooseHallTableViewCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    @IBOutlet weak var chooseHallTableView: UITableView! {
        didSet {
            chooseHallTableView.dataSource = self
            chooseHallTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chooseHallTableView.register(UINib(nibName: "ChooseHallTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseHallTableViewCell")
        chooseHallTableView.reloadData()
        
        self.navigationItem.title = "Забронировать"
        
    }

}
