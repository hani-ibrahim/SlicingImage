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
    @IBOutlet var scrollView: UIScrollView!
    
    var scrollViewProgress: CGFloat {
        let progressRatio = scrollView.contentOffset.y / scrollView.frame.height
        return min(max(progressRatio, 0), 1)
    }

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
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 2)
        slicingImage.update(progress: scrollViewProgress)
    }
}

extension DemoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slicingImage.update(progress: scrollViewProgress)
    }
}
