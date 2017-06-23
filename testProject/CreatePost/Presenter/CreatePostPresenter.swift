//
//  CreatePostCreatePostPresenter.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

class CreatePostPresenter: CreatePostModuleInput, CreatePostViewOutput, CreatePostInteractorOutput {

    weak var view: CreatePostViewInput!
    var interactor: CreatePostInteractorInput!
    var router: CreatePostRouterInput!

    func viewIsReady() {

    }
}
