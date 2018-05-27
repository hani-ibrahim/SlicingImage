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
        
        slicingImage.animators = [TranslationAnimator(direction: .bottom), FadeAnimator()]
        slicingImage.imageDivider = ImageStripeDivider(direction: .vertical)
        slicingImage.sliceCreator = PrecentageSliceCreator(sliceStartShift: 0.2, sliceEndShift: 0.2)
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
