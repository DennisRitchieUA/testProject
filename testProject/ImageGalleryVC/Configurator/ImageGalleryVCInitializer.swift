//
//  ImageGalleryVCImageGalleryVCInitializer.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class ImageGalleryVCModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var imagegalleryvcViewController: ImageGalleryVCViewController!

    override func awakeFromNib() {

        let configurator = ImageGalleryVCModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: imagegalleryvcViewController)
    }

}
