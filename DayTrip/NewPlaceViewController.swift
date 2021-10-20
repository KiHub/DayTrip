//
//  NewPlaceViewController.swift
//  DayTrip
//
//  Created by  Mr.Ki on 15.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    var newPlace: Place
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var placeImage: UIImageView!
    
    
    @IBOutlet weak var placeLocation: UITextField!
    
    @IBOutlet weak var placeName: UITextField!
    
    @IBOutlet weak var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.hideKeyboardWhenTappedAround()
        tableView.tableFooterView = UIView()
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    
    }

    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "handshake-96")
            let imageIcon = #imageLiteral(resourceName: "software_box-96")
            
            
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
              self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
               self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(imageIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
            
        } else {
            self.hideKeyboardWhenTappedAround()
        }
    }
   
    func saveNewPlace()  {
        
        newPlace = Place(name: placeName.text!, location: placeName.text, type: placeType.text, image: placeImage.image, samplePlaceImage: nil)
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
    
    @objc private func textFieldChanged() {
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
    }
    
    
    
    }
//MARK: Work with image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
func chooseImagePicker(source: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(source) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        present(imagePicker, animated: true)
        
    }

}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        dismiss(animated: true)
    }
    
}
