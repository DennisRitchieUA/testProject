//
//  CreatePostCreatePostInitializer.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class CreatePostModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var createpostViewController: CreatePostViewController!

    override func awakeFromNib() {

        let configurator = CreatePostModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: createpostViewController)
    }

}
