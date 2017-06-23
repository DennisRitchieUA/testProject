//
//  UserLoginUserLoginViewInput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

protocol UserLoginViewInput: class {

    /**
        @author dennisritchieua
        Setup initial state of the view
    */

    func setupInitialState()
    func updateScrollViewContentOffset(delta: Float)
    func hideKeyboard()
}
