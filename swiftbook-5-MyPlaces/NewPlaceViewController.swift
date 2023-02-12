//
//  NewPlaceViewController.swift
//  swiftbook-5-MyPlaces
//
//  Created by Влад on 11.02.23.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    var newPlace: Place?
    var imageIsChanged = false
    
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var typeName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        
        placeName.addTarget(self, action: #selector(textFieldChaged) , for: .editingChanged)
    }
    
    
    //скрываем по нажатию на любую ячейку кроме 1-ой
    //MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "camera", style: .default){ _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(UIImage(systemName: "camera"), forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "photo", style: .default){ _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(UIImage(systemName: "photo"), forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        }else{
            view.endEditing(true)
        }
    }
    func saveNewPlace(){

        var image: UIImage?
        
        if imageIsChanged{
            image = placeImage.image
        }else{
            image = UIImage(systemName: "questionmark.folder")
        }
        
        newPlace = Place(name: placeName.text!, location: locationName.text, type: typeName.text, restaurantImage: nil , image: image)
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

//MARK: Text field delegate
extension NewPlaceViewController: UITextFieldDelegate{
    //скрываем клавиатуру по нажатию DONE
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChaged(){
        if placeName.text?.isEmpty == false{
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
}

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType){
        
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController , didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
    }
}
