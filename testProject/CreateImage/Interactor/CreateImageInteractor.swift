//
//  UserRegistrationUserRegistrationInteractor.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD
import Alamofire

class UserRegistrationInteractor: NSObject, UserRegistrationInteractorInput, UIImagePickerModuleOutput, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ValidateModuleOutput {
    
    var validator:ValidateModuleInput!
    weak var output: UserRegistrationInteractorOutput!
    var imagePickerModule: UIImagePickerModuleInput!
    var errorAlert: ErrorAlertModuleInput!
    
    func fieldIsEmpty(text: String?) -> Bool {
        return validator.fieldIsEmpty(text: text)
    }
    
    func validateEmail(email: String?) -> Bool{
        return validator.validateEmail(email: email)
    }
    
    func checkImageExist(image: UIImage?) -> Bool{
        return validator.imageExist(image: image)
    }
    
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
    
    func prepareParams(email: String!, password: String!, userName: String?) -> Parameters {
        guard let userName = userName else {
            return Parameters(dictionaryLiteral: ("email", email), ("password", password))
        }
        return Parameters(dictionaryLiteral: ("email", email), ("password", password), ("username", userName))
    }
    
    func prepareDataFromImage(image: UIImage) -> NSData {
        return UIImageJPEGRepresentation(image, 0.9)! as NSData
    }
    
    func signUp(with params: Parameters!, userAvatarData: NSData!, completionHandler:@escaping (Bool, String?) -> ()) {
        SVProgressHUD.show()
        
        WebManager().signUp(with: params, userAvatarData: userAvatarData) { (response) in
            SVProgressHUD.dismiss()
            if (response.error == nil) {
                completionHandler(false, nil)
            } else {
                completionHandler(true, response.error?.localizedDescription)
            }
        }
    }
    
    
}
