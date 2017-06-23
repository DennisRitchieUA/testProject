//
//  UserLoginUserLoginInitializer.swift
//  testProject
//
//  Created by dennisritchieua on 21/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class UserLoginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var userloginViewController: UserLoginViewController!

    override func awakeFromNib() {

        let configurator = UserLoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: userloginViewController)
    }

}
