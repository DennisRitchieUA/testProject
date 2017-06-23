//
//  UserRegistrationUserRegistrationInteractorInput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit
import Foundation

protocol UserRegistrationInteractorInput {

    func prepareImageSourcePicker() -> UIAlertController
    func prepareImagePicker(withType type: UIImagePickerControllerSourceType) -> UIImagePickerController
    func prepareAlertError(withText textError: String?) -> UIAlertController?
}
