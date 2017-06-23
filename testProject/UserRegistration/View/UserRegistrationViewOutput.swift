//
//  UserRegistrationUserRegistrationViewOutput.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

protocol UserRegistrationViewOutput {

    /**
        @author dennisritchieua
        Notify presenter that view is ready
    */

    func viewIsReady()
    func setupKeyboardPadding()
    func keyboardHiddenTapped()
    func selectAvatarTapped()
    func setupFieldToNextField(senderField: UITextField, nextField: UITextField)
    func setupDoneEditField(textField: UITextField)
    func signUp(withParametrs avatar:UIImage?, userName: String?, email: String?, password: String?)
}
