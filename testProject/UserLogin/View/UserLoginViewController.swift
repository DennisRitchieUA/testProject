//
//  UserLoginUserLoginViewController.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit


class UserLoginViewController: UIViewController, UserLoginViewInput {
    
    var output: UserLoginViewOutput!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: UserLoginViewInput
    func setupInitialState() {
        output.setupKeyboardPadding()
        output.setupFieldToNextField(senderField: emailField, nextField: passwordField)
        output.setupDoneEditField(textField: passwordField)
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapHideKeyboard(sender:)))
        gesture.cancelsTouchesInView = true
        scrollView.addGestureRecognizer(gesture)
    }
    

    
    // MARK: Actions
    @IBAction func signUp(_ sender: UIButton) {
        output.signUpAction()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        output.signInButtonPressed(signWithValidate : emailField.text!, password: passwordField.text!)
    }
    
    func didTapHideKeyboard(sender: UITapGestureRecognizer) {
        output.keyboardHiddenTapped()
    }
    
    // MARK: SupportedMethod

    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func updateScrollViewContentOffset(delta: Float) {
        self.scrollView.contentInset.bottom = CGFloat(delta)
    }
}
