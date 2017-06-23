//
//  UserRegistrationUserRegistrationInteractorInput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

protocol UserRegistrationInteractorInput {
    
    func prepareImageSourcePicker() -> UIAlertController
    func prepareImagePicker(withType type: UIImagePickerControllerSourceType) -> UIImagePickerController
    func prepareAlertError(withText textError: String?) -> UIAlertController?
    func fieldIsEmpty(text: String?) -> Bool
    func validateEmail(email: String?) -> Bool
    func checkImageExist(image: UIImage?) -> Bool
    func prepareParams(email: String!, password: String!, userName: String?) -> Parameters
    func signUp(with params: Parameters!, userAvatarData: NSData!, completionHandler:@escaping (Bool, String?) -> ())
    func prepareDataFromImage(image: UIImage) -> NSData
}
