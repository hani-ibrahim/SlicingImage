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
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slicingImage.animator = TranslationAnimator(direction: .bottom, positionStartShift: 0, positionEndShift: 0)
        slicingImage.imageDivider = ImageStripeDivider(direction: .vertical)
        slicingImage.sliceCreator = PrecentageSliceCreator(sliceStartShift: 0, sliceEndShift: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let image = UIImage(named: "sample-image") {
            slicingImage.configure(for: image, into: 20)
        }
        slicingImage.update(progress: CGFloat(slider.value))
    }
    
    @IBAction private func sliderValueChanged() {
        slicingImage.update(progress: CGFloat(slider.value))
    }
}
