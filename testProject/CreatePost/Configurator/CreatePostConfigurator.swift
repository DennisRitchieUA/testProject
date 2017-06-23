//
//  CreatePostCreatePostConfigurator.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class CreatePostModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CreatePostViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CreatePostViewController) {

        let router = CreatePostRouter()
        router.viewController = viewController

        let presenter = CreatePostPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreatePostInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
