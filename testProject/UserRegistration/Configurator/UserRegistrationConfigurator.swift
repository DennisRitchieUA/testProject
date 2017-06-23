//
//  UserRegistrationUserRegistrationConfigurator.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserRegistrationModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? UserRegistrationViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: UserRegistrationViewController) {
        
        let validator = ValidateModule()
        let keyboardManager = KeyboardManager()
        let imagePickerModule = UIImagePickerModule()
        let errorModule = ErrorAlertModule()

        
        let router = UserRegistrationRouter()
        router.viewController = viewController
        
        let presenter = UserRegistrationPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.keyboardManager = keyboardManager
        presenter.validator = validator
        
        let interactor = UserRegistrationInteractor()
        interactor.output = presenter
        interactor.imagePickerModule = imagePickerModule
        interactor.errorAlert = errorModule
        
        keyboardManager.output = presenter
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
