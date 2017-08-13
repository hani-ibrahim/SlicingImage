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
        if let image = UIImage(named: "testPattern") {
            slicingImage.animator = FadeAnimator()
            slicingImage.imageDivider = ImageStripeDivider(direction: .vertical)
            slicingImage.configure(for: image, into: 10)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 2)
        slicingImage.update(progress: scrollViewProgress)
    }
}

extension DemoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slicingImage.update(progress: scrollViewProgress)
    }
}
