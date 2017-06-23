//
//  UserRegistrationUserRegistrationViewController.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserRegistrationViewController: UIViewController, UserRegistrationViewInput {
    
    var output: UserRegistrationViewOutput!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    
    // MARK: UserRegistrationViewInput
    func setupInitialState() {
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.size.height / 2.0
        
        output.setupFieldToNextField(senderField: userNameField, nextField: emailField)
        output.setupFieldToNextField(senderField: emailField, nextField: passwordField)
        output.setupDoneEditField(textField: passwordField)
        
        output.keyboardHiddenTapped()
        output.setupKeyboardPadding()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapHideKeyboard(sender:)))
        gesture.cancelsTouchesInView = true
        scrollView.addGestureRecognizer(gesture)
        
        let gestureSelectImage = UITapGestureRecognizer.init(target: self, action: #selector(didTapSelectAvatar(sender:)))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(gestureSelectImage)
    }
    
    // MARK: Actions
    @IBAction func sendAction(_ sender: Any) {
        output.signUp(withParametrs: avatarImage.image, userName: userNameField.text, email: emailField.text, password: passwordField.text)
    }
    
    func didTapHideKeyboard(sender: UITapGestureRecognizer) {
        output.keyboardHiddenTapped()
    }
    
    func didTapSelectAvatar(sender: UITapGestureRecognizer) {
        output.selectAvatarTapped()
    }
    
    // MARK: SupportedMethod
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func updateScrollViewContentOffset(delta: Float) {
        self.scrollView.contentInset.bottom = CGFloat(delta)
    }
    
    func imageSelected(image: UIImage) {
        avatarImage.image = image
    }
}
