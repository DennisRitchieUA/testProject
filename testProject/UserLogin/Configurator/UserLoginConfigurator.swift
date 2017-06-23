//
//  UserLoginUserLoginConfigurator.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserLoginModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? UserLoginViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: UserLoginViewController) {
        
        let keyboardManager = KeyboardManager()
        let validator = ValidateModule()
        let errorModule = ErrorAlertModule()
        
        let router = UserLoginRouter()
        router.viewController = viewController
        
        let presenter = UserLoginPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.keyboardManager = keyboardManager
        presenter.validator = validator
        
        let interactor = UserLoginInteractor()
        interactor.output = presenter
        interactor.errorAlert = errorModule
        
        keyboardManager.output = presenter
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
