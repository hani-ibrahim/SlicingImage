//
//  DemoViewController.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet var slicingImage: SlicingImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "test-image") {
            slicingImage.configure(for: image, into: 20, inDirection: .vertical)
        }
    }
}

