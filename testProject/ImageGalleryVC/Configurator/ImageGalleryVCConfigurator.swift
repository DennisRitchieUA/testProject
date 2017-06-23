//
//  ImageGalleryVCImageGalleryVCConfigurator.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class ImageGalleryVCModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ImageGalleryVCViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ImageGalleryVCViewController) {

        let router = ImageGalleryVCRouter()
        router.viewController = viewController

        let presenter = ImageGalleryVCPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ImageGalleryVCInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
