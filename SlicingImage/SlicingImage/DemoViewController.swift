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
    
//    let animator: Animator = TranslationAnimator()
//    var scrollViewProgress: CGFloat {
//        let progressRatio = scrollView.contentOffset.y / scrollView.bounds.height
//        return min(max(progressRatio, 0), 1)
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let image = UIImage(named: "testPattern") {
            slicingImage.imageDivider = ImageStripeDivider(direction: .vertical)
            slicingImage.configure(for: image, into: 10)
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let image = UIImage(named: "test-image") {
//            slicingImage.configure(for: image, into: 10, inDirection: .vertical)
//            slicingImage.animator = animator
//            animate()
//        }
//    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
//        slicingImage.update(progress: scrollViewProgress)
//    }
    
}

extension DemoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        slicingImage.update(progress: scrollViewProgress)
    }
}
