//
//  NewPlaceViewController.swift
//  DayTrip
//
//  Created by  Mr.Ki on 15.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.hideKeyboardWhenTappedAround()
        tableView.tableFooterView = UIView()
       
    }
    
   

    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Yes")
        } else {
            self.hideKeyboardWhenTappedAround()
        }
    }
   
   
    
}

 

extension UITableViewController {
    func hideKeyboardWhenTappedAround() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



// MARK: Tex field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру по тапу на Done
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    }

