//
//  UserRegistrationUserRegistrationRouterInput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import UIKit

protocol UserRegistrationRouterInput {
    
    func presentAlertController(alert: UIAlertController)
    func dismissAlertController(alert: UIAlertController)
    
    func presentImagePicker(imagePicker: UIImagePickerController)
    func dismissPicker(imagePicker: UIImagePickerController)
    
    func showErrorAlert(alert: UIAlertController?)
    
    func presentMainVC()
}
