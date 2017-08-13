//
//  FadeAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/20/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public struct FadeAnimator: Animator {
    
    public func update(progress: CGFloat, for slices: [UIView]) {
        slices.enumerated().forEach { (idx, slice) in
            let alpha = progress * CGFloat(slices.count) - CGFloat(idx)
            slice.alpha = min(max(alpha, 0), 1)
        }
    }
}
