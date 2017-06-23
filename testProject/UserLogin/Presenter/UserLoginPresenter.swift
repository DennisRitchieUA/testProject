//
//  UserLoginUserLoginPresenter.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//
import UIKit


class UserLoginPresenter: UserLoginModuleInput, UserLoginViewOutput, UserLoginInteractorOutput, KeyboardManagerModuleOutput, ValidateModuleOutput {
    
    var validator:ValidateModuleInput!
    var keyboardManager:KeyboardManagerModuleInput!
    weak var view: UserLoginViewInput!
    var interactor: UserLoginInteractorInput!
    var router: UserLoginRouterInput!
    
    var nextFieldsArray = [UITextField]()
    weak var doneField: UITextField!
    
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func signUpAction() {
        router.pushSignUpViewController()
    }
    
    func signInButtonPressed(signWithValidate email: String, password: String) {
        
        self.keyboardHiddenTapped()
        
        if (validator.fieldIsEmpty(text:email)) {
            router.showErrorAlert(alert: interactor.prepareAlertError(withText: "Email can not be empty"))
            return
        }
        
        if (validator.fieldIsEmpty(text:password)) {
            router.showErrorAlert(alert: interactor.prepareAlertError(withText: "Password can not be empty"))
            return
        }
        
        if (validator.validateEmail(email: email) == false) {
            router.showErrorAlert(alert: interactor.prepareAlertError(withText: "Email not valid"))
            return
        }
        
    }
    
    func setupKeyboardPadding() {
        keyboardManager.beginManageKeyboard()
    }
    
    func scrollViewShowing(yPadding: Float) {
        view.updateScrollViewContentOffset(delta: yPadding)
    }
    
    func keyboardHiddenTapped() {
        view.hideKeyboard()
    }
    
    func setupFieldToNextField(senderField: UITextField, nextField: UITextField) {
        if (nextFieldsArray.count == 0) {
            nextFieldsArray.append(senderField)
        }
        
        nextFieldsArray.append(nextField)
        senderField.addTarget(self, action: #selector(nextFieldBecome(sender:)), for: .editingDidEndOnExit)
    }
    
    func setupDoneEditField(textField: UITextField) {
        doneField = textField
        doneField.addTarget(self, action: #selector(doneFieldReturnButtonTapped(sender:)), for: .editingDidEndOnExit)
    }
    
    @objc func nextFieldBecome(sender: UITextField) {
        keyboardManager.nextFieldToEdit(sender: sender, fieldsArray: nextFieldsArray)?.becomeFirstResponder()
    }
    
    @objc func doneFieldReturnButtonTapped(sender: UITextField) {
        if (keyboardManager.needHideKeyboard(sender: sender, doneField: doneField)) {
            sender.resignFirstResponder()
        }
    }
    
}
