//
//  TranslationAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/25/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class TranslationAnimator {
    
    private let direction: Direction
    private let positionStartShift: CGFloat
    private let positionEndShift: CGFloat
    
    public enum Direction {
        case top
        case right
        case bottom
        case left
    }
    
    public init(direction: Direction, positionStartShift: CGFloat, positionEndShift: CGFloat) {
        self.direction = direction
        self.positionStartShift = positionStartShift
        self.positionEndShift = positionEndShift
    }
}

extension TranslationAnimator: Animator {
    public func update(progress: CGFloat, for slices: [Slice]) {
        slices.enumerated().forEach { (idx, slice) in
            let position = (progress - slice.progressRange.upperBound) / (slice.progressRange.upperBound - slice.progressRange.lowerBound)
            let relativePosition = min(max(position, -1), 0)
            switch direction {
            case .top: slice.view.transform = CGAffineTransform(translationX: 0, y: -relativePosition * slice.view.frame.height)
            case .right: slice.view.transform = CGAffineTransform(translationX: relativePosition * slice.view.frame.width, y: 0)
            case .bottom: slice.view.transform = CGAffineTransform(translationX: 0, y: relativePosition * slice.view.frame.height)
            case .left: slice.view.transform = CGAffineTransform(translationX: -relativePosition * slice.view.frame.width, y: 0)
            }
        }
    }
}
