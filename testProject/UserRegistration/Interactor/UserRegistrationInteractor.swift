//
//  UserRegistrationUserRegistrationInteractor.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit
import Foundation

class UserRegistrationInteractor: NSObject, UserRegistrationInteractorInput, UIImagePickerModuleOutput, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var output: UserRegistrationInteractorOutput!
    var imagePickerModule: UIImagePickerModuleInput!
    var errorAlert: ErrorAlertModuleInput!

    
    func prepareImageSourcePicker() -> UIAlertController {
        
        let pickerActionMakePhoto = UIAlertAction.init(title: "Take photo", style: .default, handler: { (action) in
            self.output.sourceSelected(type: .camera)
        })
        
        let pickerActionChoisePhoto = UIAlertAction.init(title: "Choose photo", style: .default, handler: { (action) in
            self.output.sourceSelected(type: .photoLibrary)
        })
        
        let imageSourcePicker = imagePickerModule.imagePickermageSourcePicker(actions: [pickerActionMakePhoto, pickerActionChoisePhoto])
        return imageSourcePicker
    }
    
    func prepareImagePicker(withType type: UIImagePickerControllerSourceType) -> UIImagePickerController {
        let imagePicker = imagePickerModule.imagePicker(withType: type)
        imagePicker.delegate = self
        return imagePicker
    }
    
    func prepareAlertError(withText textError: String?) -> UIAlertController? {
        guard let alert = errorAlert.createErrorAlert(withText: textError) else { return nil }
        return alert
    }
    
    // MARK: ImagePickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        output.imageCreated(image: selectedImage)
        output.needDismissImagePicker(picker: picker)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        output.needDismissImagePicker(picker: picker)
    }
    
}
