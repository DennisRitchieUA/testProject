//
//  UserRegistrationUserRegistrationInitializer.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserRegistrationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var userregistrationViewController: UserRegistrationViewController!

    override func awakeFromNib() {

        let configurator = UserRegistrationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: userregistrationViewController)
    }

}
