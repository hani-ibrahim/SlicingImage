//
//  FadeAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/20/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class FadeAnimator: Animator {
    
    public func update(progress: CGFloat, for slices: [Slice]) {
        slices.forEach { slice in
            let alpha = (progress - slice.progressRange.lowerBound) / (slice.progressRange.upperBound - slice.progressRange.lowerBound)
            slice.view.alpha = min(max(alpha, 0), 1)
        }
    }
}
