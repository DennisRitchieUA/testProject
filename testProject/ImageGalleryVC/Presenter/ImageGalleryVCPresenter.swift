//
//  ImageGalleryVCImageGalleryVCPresenter.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

class ImageGalleryVCPresenter: ImageGalleryVCModuleInput, ImageGalleryVCViewOutput, ImageGalleryVCInteractorOutput {

    weak var view: ImageGalleryVCViewInput!
    var interactor: ImageGalleryVCInteractorInput!
    var router: ImageGalleryVCRouterInput!

    func viewIsReady() {

    }
}
