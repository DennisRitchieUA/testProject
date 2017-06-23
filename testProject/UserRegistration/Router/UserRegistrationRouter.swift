//
//  UserRegistrationUserRegistrationRouter.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserRegistrationRouter: UserRegistrationRouterInput {
    var viewController: UserRegistrationViewController!
    
    func presentAlertController(alert: UIAlertController){
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func dismissAlertController(alert: UIAlertController){
        alert.dismiss(animated: true, completion: nil)
    }
    
    func presentImagePicker(imagePicker: UIImagePickerController) {
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func dismissPicker(imagePicker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func showErrorAlert(alert: UIAlertController?) {
        guard let alert = alert else { return }
        viewController.present(alert, animated: true, completion: nil)
    }
}
