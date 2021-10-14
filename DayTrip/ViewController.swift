//
//  ViewController.swift
//  DayTrip
//
//  Created by  Mr.Ki on 13.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let placesNames = [
        "Town Hall", "Saint Servatus", "Old Bridge", "Fort Sint Piter",
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = placesNames[indexPath.row]
        
        
        return cell!
    }

}

