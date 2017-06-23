//
//  GifViewerGifViewerPresenter.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

class GifViewerPresenter: GifViewerModuleInput, GifViewerViewOutput, GifViewerInteractorOutput {

    weak var view: GifViewerViewInput!
    var interactor: GifViewerInteractorInput!
    var router: GifViewerRouterInput!

    func viewIsReady() {

    }
}
