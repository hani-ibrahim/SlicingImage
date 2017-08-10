//
//  TranslationAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/25/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

//public enum TranslationDirection {
//    case top
//    case right
//    case bottom
//    case left
//}
//
//public class TranslationAnimator: Animator {
//    
//    public var stripes: [ImageStripe] = [] {
//        didSet {
//            updateProgress()
//        }
//    }
//    public var direction: SlicingDirection = .vertical {
//        didSet {
//            updateProgress()
//        }
//    }
//    public var progress: CGFloat = 0 {
//        didSet {
//            updateProgress()
//        }
//    }
//    public var translationDirection: TranslationDirection = .right {
//        didSet {
//            updateProgress()
//        }
//    }
//    
//    public func updateProgress() {
//        let count = CGFloat(stripes.count)
//        let stripeProgressLength: CGFloat = 1 / count
//        for (idx, stripe) in stripes.enumerated() {
//            let position = 1 + CGFloat(idx) - progress / stripeProgressLength
//            let relativePosition = min(max(position, 0), 1)
//            switch translationDirection {
//            case .top: stripe.transform = CGAffineTransform(translationX: 0, y: -relativePosition * stripe.frame.height)
//            case .right: stripe.transform = CGAffineTransform(translationX: relativePosition * stripe.frame.width, y: 0)
//            case .bottom: stripe.transform = CGAffineTransform(translationX: 0, y: relativePosition * stripe.frame.height)
//            case .left: stripe.transform = CGAffineTransform(translationX: -relativePosition * stripe.frame.width, y: 0)
//            }
//        }
//    }
//}
