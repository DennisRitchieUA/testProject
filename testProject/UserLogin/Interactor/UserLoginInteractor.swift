//
//  UserLoginUserLoginInteractor.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserLoginInteractor: UserLoginInteractorInput {
    
    weak var output: UserLoginInteractorOutput!
    var errorAlert: ErrorAlertModuleInput!

    func prepareAlertError(withText textError: String?) -> UIAlertController? {
        guard let alert = errorAlert.createErrorAlert(withText: textError) else { return nil }
        return alert
    }
}
