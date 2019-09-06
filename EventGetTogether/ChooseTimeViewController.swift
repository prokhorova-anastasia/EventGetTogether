

import UIKit

class ChooseTimeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var timeArray: [String] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as? TimeCollectionViewCell {
            cell.timeLabel.text = timeArray[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayuot: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 98, height: 52)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8.5, bottom: 8, right: 8.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        self.chooseTimeCollectionView.reloadData()
    }
    
    @IBOutlet weak var chooseTimeCollectionView: UICollectionView! {
        didSet {
            chooseTimeCollectionView.delegate = self
            chooseTimeCollectionView.dataSource = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 9...21{
            timeArray.append("\(i):00")
            timeArray.append("\(i):30")
        }
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)
        
        self.navigationItem.title = "Выбор времени"
        
        chooseTimeCollectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
        
        chooseTimeCollectionView.reloadData()

    }
    

}
