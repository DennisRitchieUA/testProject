//
//  GifViewerGifViewerConfigurator.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class GifViewerModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? GifViewerViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: GifViewerViewController) {

        let router = GifViewerRouter()
        router.viewController = viewController

        let presenter = GifViewerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GifViewerInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
