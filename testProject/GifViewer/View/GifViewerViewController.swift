//
//  GifViewerGifViewerViewController.swift
//  testProject
//
//  Created by Dennis Ritchie on 23/06/2017.
//  Copyright © 2017 v-jet. All rights reserved.
//

import UIKit

class GifViewerViewController: UIViewController, GifViewerViewInput {

    var output: GifViewerViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: GifViewerViewInput
    func setupInitialState() {
    }
}
