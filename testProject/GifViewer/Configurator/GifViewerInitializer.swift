//
//  GifViewerGifViewerInitializer.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class GifViewerModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var gifviewerViewController: GifViewerViewController!

    override func awakeFromNib() {

        let configurator = GifViewerModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: gifviewerViewController)
    }

}
