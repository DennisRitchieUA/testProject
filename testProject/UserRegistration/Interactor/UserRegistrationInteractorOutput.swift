//
//  UserRegistrationUserRegistrationInteractorOutput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import UIKit

protocol UserRegistrationInteractorOutput: class {

    func imageCreated(image: UIImage)
    func sourceSelected(type: UIImagePickerControllerSourceType)
    func needDismissImagePicker(picker: UIImagePickerController)
}
