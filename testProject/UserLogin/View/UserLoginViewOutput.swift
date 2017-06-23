//
//  UserLoginUserLoginViewOutput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

protocol UserLoginViewOutput {
    
    /**
     @author dennisritchieua
     Notify presenter that view is ready
     */
    
    func viewIsReady()
    func signUpAction()
    func setupKeyboardPadding()
    func keyboardHiddenTapped()
    func setupFieldToNextField(senderField: UITextField, nextField: UITextField)
    func setupDoneEditField(textField: UITextField)
    func signInButtonPressed(signWithValidate email: String, password: String)
}
