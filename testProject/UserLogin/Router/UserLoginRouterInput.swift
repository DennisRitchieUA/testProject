//
//  UserLoginUserLoginRouterInput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import UIKit

protocol UserLoginRouterInput {
    
    func pushSignUpViewController()
    func presentMainVC()
    func showErrorAlert(alert: UIAlertController?)
}
