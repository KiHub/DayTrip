//
//  ViewController.swift
//  DayTrip
//
//  Created by  Mr.Ki on 13.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let placesNames = [
        "Town Wall", "Saint Servatus", "Old Bridge", "Fort Sint Piter",
        "City Hall", "Bonnefanten Museum", "Basilica", "Bishops Mill"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.nameLabel.text = placesNames[indexPath.row]
        cell.imageOfPlace.image = UIImage(named: placesNames[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
        
    }
    
    // MARK: - Table wiew delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

}

