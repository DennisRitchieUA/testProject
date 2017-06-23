//
//  UserRegistrationUserRegistrationPresenter.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit
import RxKeyboard
import RxCocoa
import RxSwift

class UserRegistrationPresenter: UserRegistrationModuleInput, UserRegistrationViewOutput, UserRegistrationInteractorOutput, KeyboardManagerModuleOutput, ValidateModuleOutput {
    
    var validator:ValidateModuleInput!
    var keyboardManager:KeyboardManagerModuleInput!
    weak var view: UserRegistrationViewInput!
    var interactor: UserRegistrationInteractorInput!
    var router: UserRegistrationRouterInput!
    let disposeBag = DisposeBag()
    var nextFieldsArray = [UITextField]()
    weak var doneField: UITextField!
    
    func viewIsReady() {
        view.setupInitialState()
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
    
    func selectAvatarTapped() {
        let imageSourcePicker = interactor.prepareImageSourcePicker()
        router.presentAlertController(alert: imageSourcePicker)
    }
    
    func sourceSelected(type: UIImagePickerControllerSourceType) {
        let imagePicker = interactor.prepareImagePicker(withType: type)
        router.presentImagePicker(imagePicker: imagePicker)
    }
    
    func needDismissImagePicker(picker: UIImagePickerController) {
        router.dismissPicker(imagePicker: picker)
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
    
    func imageCreated(image: UIImage) {
        view.imageSelected(image: image)
    }
    
    // MARK: Registration
    
    func signUp(withParametrs avatar:UIImage?, userName: String?, email: String?, password: String?) {
        
        self.keyboardHiddenTapped()
        
        if (validator.fieldIsEmpty(text:userName)) {
            router.showErrorAlert(alert: interactor.prepareAlertError(withText: "Username can not be empty"))
            return
        }
        
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
    
}
