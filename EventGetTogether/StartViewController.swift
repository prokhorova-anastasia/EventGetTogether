
import UIKit
import Alamofire

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrayCount: Int?
    var serverCard = ServerCardResponse()
    
    var filterServerCard: [ServerCard] = []
    
    var filterVC = FilterViewController()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = serverCard.results?.count {
          return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell {
            cell.selectionStyle = .none
            
            if let nameEvent = serverCard.results?[indexPath.row].description {
                DispatchQueue.main.async {
                cell.nameEventLabel.text = nameEvent
                }
            }
            
            if let nameAuthor =  serverCard.results?[indexPath.row].authorName {
                DispatchQueue.main.async {
                cell.nameAndPhoneAuthorLabel.text = nameAuthor
                }
            }
            
            if let phoneAuthor =  serverCard.results?[indexPath.row].authorPhone {
                DispatchQueue.main.async {
                cell.nameAndPhoneAuthorLabel.text = cell.nameAndPhoneAuthorLabel.text! + ", " + phoneAuthor
                }
            }
            
            if let startEvent =  serverCard.results?[indexPath.row].startDate {
                let date = Date(timeIntervalSince1970: TimeInterval(startEvent))
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                DispatchQueue.main.async {
                cell.starEventLabel.text = dateFormatter.string(from: date)
                }
            }
            
            if let status =  serverCard.results?[indexPath.row].status {
                let statusString = self.statusNumberToString(number: status)
                DispatchQueue.main.async {
                cell.statusImageView.image = UIImage(named: statusString!)
                }
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.fetchRooms(id: indexPath.row)
        }
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
        
        self.eventTableView.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)
        
        self.eventTableView.separatorColor = UIColor.clear
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.fetchRoomsForArray()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchRoomsForArray()
    }
    
    @objc func addEvent() {
        let appointmentBookingVC = AppointmentBookingViewController()
        self.navigationController?.pushViewController(appointmentBookingVC, animated: true)
    }
    
    @objc func filterEvent() {
        let filterVC = FilterViewController()
        self.navigationController?.pushViewController(filterVC, animated: true)
    }
    
    func fetchRoomsForArray() {
        Alamofire.request("http://gt-schedule.profsoft.online/api/event/", method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                guard let data = response.data else { return }
                do {
                    self.serverCard.results = try JSONDecoder().decode([ServerCard].self, from: data)
                    self.serverCard.resultsCount = self.serverCard.results?.count
                    DispatchQueue.main.async {
                        self.eventTableView.reloadData()
                    }
                    
                } catch {return}
            
            case .failure(let error):
            print(error.localizedDescription)
            }
        }
    }
    
    func statusNumberToString (number: Int) -> String? {
        switch number {
        case 0:
            return "new"
        case 1:
            return "confirm"
        case 2:
            return "canceled"
        default:
            return nil
        }
    }
    
    func fetchRooms(id: Int) {
        Alamofire.request("http://gt-schedule.profsoft.online/api/event/\(id + 1)", method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response.data)
                guard let data = response.data else { return }
                do {
                    let resultID = try JSONDecoder().decode(ServerCard.self, from: data)
                    let aboutEventVC = AboutEventViewController()
                    aboutEventVC.resultAboutEventID = resultID
                    
                    self.navigationController?.pushViewController(aboutEventVC, animated: true)
                    
                } catch {return}
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
