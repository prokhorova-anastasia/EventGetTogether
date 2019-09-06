

import UIKit

class AppointmentBookingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseHallTableViewCell", for: indexPath) as? ChooseHallTableViewCell {
            cell.selectionStyle = .none
            cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonClicked(sender: )), for: .touchUpInside)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    @objc func checkBoxButtonClicked( sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
        chooseHallTableView.reloadData()
    }
    
    @IBOutlet weak var chooseDateButton: UIButton!
    @IBOutlet weak var bookNowButton: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var telphoneImageView: UIImageView!
    @IBOutlet weak var chooseHallTableView: UITableView! {
        didSet {
            chooseHallTableView.dataSource = self
            chooseHallTableView.delegate = self
        }
    }
    
    @IBOutlet weak var chooseDateTextField: UITextField!
    @IBOutlet weak var chooseDateView: UIView!
    
    @IBOutlet weak var informationView: UIView!
    @IBAction func chooseDateButton(_ sender: Any) {
        let chooseHallVC = ChooseTimeViewController()
        self.navigationController?.pushViewController(chooseHallVC, animated: true)
        
    }
    
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)

        chooseHallTableView.register(UINib(nibName: "ChooseHallTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseHallTableViewCell")
        chooseHallTableView.reloadData()
        
        self.navigationItem.title = "Забронировать"
        
        chooseHallTableView?.clipsToBounds = true
        chooseHallTableView!.layer.cornerRadius = 6
        
        informationView?.clipsToBounds = true
        informationView!.layer.cornerRadius = 6
        
        chooseDateButton?.clipsToBounds = true
        chooseDateButton!.layer.cornerRadius = 6
        
        chooseDateView?.clipsToBounds = true
        chooseDateView!.layer.cornerRadius = 6
        
        bookNowButton?.clipsToBounds = true
        bookNowButton!.layer.cornerRadius = 6
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker: )), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer: )))
        view.addGestureRecognizer(tapGesture)
        
        chooseDateTextField.inputView = datePicker
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        chooseDateTextField?.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

}
