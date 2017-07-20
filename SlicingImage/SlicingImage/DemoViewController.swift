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
    
    let animator: FadeAnimator = FadeAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "test-image") {
            slicingImage.configure(for: image, into: 50, inDirection: .vertical)
            slicingImage.animator = animator
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        slicingImage.update(progress: scrollViewProgress)
    }
    
    var scrollViewProgress: CGFloat {
        let progressRatio = scrollView.contentOffset.y / scrollView.bounds.height
        return min(max(progressRatio, 0), 1)
    }
}

extension DemoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slicingImage.update(progress: scrollViewProgress)
    }
}
