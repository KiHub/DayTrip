//
//  CustomTableViewCell.swift
//  DayTrip
//
//  Created by  Mr.Ki on 14.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfPlace: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         if selected {
             contentView.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.8745098039, blue: 0.8470588235, alpha: 1)
         } else {
             contentView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9647058824, blue: 0.937254902, alpha: 1)
         }
     }
    
}
