//
//  StartViewController.swift
//  EventGetTogether
//
//  Created by N on 01/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aboutEventVC = AboutEventViewController()
        
        let nc = UINavigationController(rootViewController: aboutEventVC)
        nc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        //self.navigationController?.pushViewController(aboutEventVC, animated: true)
        self.present(nc, animated: true)
    }
    
    @IBOutlet weak var eventTableView: UITableView! {
        didSet {
            eventTableView.dataSource = self
            eventTableView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "EventTableViewCell")
        eventTableView.reloadData()
        
        self.navigationItem.title = "Мероприятия"
        let addEventBarButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addEvent))
        let filterEventBarButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterEvent))
        
        self.navigationItem.setRightBarButtonItems([filterEventBarButton, addEventBarButton], animated: true)
        
        self.eventTableView.separatorColor = UIColor.clear
    }
    
    
    @objc func addEvent() {
        let appointmentBookingVC = AppointmentBookingViewController()
        self.navigationController?.pushViewController(appointmentBookingVC, animated: true)
    }
    
    @objc func filterEvent() {
        let filterVC = FilterViewController()
        self.navigationController?.pushViewController(filterVC, animated: true)
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
