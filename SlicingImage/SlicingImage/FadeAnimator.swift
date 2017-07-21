//
//  FadeAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/20/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class FadeAnimator: Animator {

    var stripes: [ImageStripe] = [] {
        didSet {
            updateProgress()
        }
    }
    var direction: SlicingDirection = .vertical {
        didSet {
            updateProgress()
        }
    }
    var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }
    
    private func updateProgress() {
        let count = CGFloat(stripes.count)
        let stripeProgressLength: CGFloat = 1 / count
        for (idx, stripe) in stripes.enumerated() {
            let alpha = progress / stripeProgressLength - CGFloat(idx)
            stripe.alpha = min(max(alpha, 0), 1)
        }
    }
}
