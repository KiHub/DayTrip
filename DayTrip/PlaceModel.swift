//
//  PlaceModel.swift
//  DayTrip
//
//  Created by  Mr.Ki on 14.10.2021.
//

import UIKit

struct Place {
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    
    var placeImage: String?
    
      static  let placesNames = [
            "Town Wall", "Saint Servatus", "Old Bridge", "Fort Sint Piter",
            "City Hall", "Bonnefanten Museum", "Basilica", "Bishops Mill"
        ]
    
  static  func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in placesNames {
            places.append(Place(name: place, location: "Maastricht", type: "Historical", image: nil, placeImage: place))
        }
    return places
    }
}
