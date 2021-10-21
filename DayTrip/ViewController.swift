//
//  ViewController.swift
//  DayTrip
//
//  Created by  Mr.Ki on 13.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
//    let placesNames = [
//        "Town Wall", "Saint Servatus", "Old Bridge", "Fort Sint Piter",
//        "City Hall", "Bonnefanten Museum", "Basilica", "Bishops Mill"
//    ]
    
    var places = Place.getPlaces()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
            cell.imageOfPlace.image = UIImage(named: place.samplePlaceImage!)
        } else {
            cell.imageOfPlace.image = place.image
        }
        
      
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
    
        
        return cell
        
    }
    
    
 
    
//    // MARK: - Table wiew delegate
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }

    @IBAction func unwindSegue( segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!)
      //  tableView()     ???
    
}
}
