//
//  FilterViewController.swift
//  EventGetTogether
//
//  Created by N on 01/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var filterIndex: Int?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FilterHallTableViewCell", for: indexPath) as? FilterHallTableViewCell {
            cell.selectionStyle = .none
            cell.checkBoxFilterButton.addTarget(self, action: #selector(checkBoxFilterButtonClicked(sender: )), for: .touchUpInside)
            if cell.checkBoxFilterButton.isSelected {
                filterIndex = indexPath.row
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    @objc func checkBoxFilterButtonClicked( sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
        filterTableView.reloadData()
    }
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var filterTableView: UITableView! {
        didSet {
            filterTableView.dataSource = self
            filterTableView.delegate = self
        }
    }
    
    var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)
        
        filterTableView.register(UINib(nibName: "FilterHallTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterHallTableViewCell")
        filterTableView.reloadData()
        
        self.navigationItem.title = "Выбор даты и зала"
        
        self.filterTableView.separatorColor = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)

        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker: )), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer: )))
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
    }

    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        inputTextField?.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

}
