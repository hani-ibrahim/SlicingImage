//
//  TranslationAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/25/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public struct TranslationAnimator {
    
    public var direction: Direction = .top
    
    public enum Direction {
        case top
        case right
        case bottom
        case left
    }
}

extension TranslationAnimator: Animator {
    
    public func update(progress: CGFloat, for slices: [UIView]) {
        slices.enumerated().forEach { (idx, slice) in
            let position = 1 + CGFloat(idx) - progress * CGFloat(slices.count)
            let relativePosition = min(max(position, 0), 1)
            switch direction {
            case .top: slice.transform = CGAffineTransform(translationX: 0, y: -relativePosition * slice.frame.height)
            case .right: slice.transform = CGAffineTransform(translationX: relativePosition * slice.frame.width, y: 0)
            case .bottom: slice.transform = CGAffineTransform(translationX: 0, y: relativePosition * slice.frame.height)
            case .left: slice.transform = CGAffineTransform(translationX: -relativePosition * slice.frame.width, y: 0)
            }
        }
    }
}
