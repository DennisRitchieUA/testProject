//
//  UserLoginUserLoginRouter.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserLoginRouter: UserLoginRouterInput {
    let kSignInModuleToSigUpModuleSegue = "kSignInModuleToSigUpModuleSegue"
    var viewController: UserLoginViewController!
    
    func pushSignUpViewController() {
        viewController.performSegue(withIdentifier: kSignInModuleToSigUpModuleSegue, sender: nil)
    }
    
    func presentMainVC() {
        
    }
    
    func showErrorAlert(alert: UIAlertController?) {
        guard let alert = alert else { return }
        viewController.present(alert, animated: true, completion: nil)
    }
}
