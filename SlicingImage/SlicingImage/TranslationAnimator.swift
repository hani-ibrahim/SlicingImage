//
//  TranslationAnimator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/25/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

enum TranslationDirection {
    case top
    case right
    case bottom
    case left
}

class TranslationAnimator: Animator {
    
    public var stripes: [ImageStripe] = [] {
        didSet {
            updateProgress()
        }
    }
    public var direction: SlicingDirection = .vertical {
        didSet {
            updateProgress()
        }
    }
    public var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }
    public var translationDirection: TranslationDirection = .right {
        didSet {
            updateProgress()
        }
    }
    
    private func updateProgress() {
        let count = CGFloat(stripes.count)
        let stripeProgressLength: CGFloat = 1 / count
        print("progress \(progress)")
        for (idx, stripe) in stripes.enumerated() {
            let position = 1 + CGFloat(idx) - progress / stripeProgressLength
            let relativePosition = min(max(position, 0), 1)
            stripe.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            stripe.alpha = 0.5
//            switch translationDirection {
//            case .top: stripe.transform = CGAffineTransform(translationX: 0, y: -relativePosition * stripe.frame.height)
//            case .right: stripe.transform = CGAffineTransform(translationX: relativePosition * stripe.frame.width, y: 0)
//            case .bottom: stripe.transform = CGAffineTransform(translationX: 0, y: relativePosition * stripe.frame.height)
//            case .left: stripe.transform = CGAffineTransform(translationX: -relativePosition * stripe.frame.width, y: 0)
//            }
            print("idx: \(idx), tx: \(stripe.transform.tx), ty: \(stripe.transform.ty)")
        }
    }
}


/*
 
 idx * stripeProgressLength -> (idx + 1) * stripeProgressLength
 0 -> 1
 
 y = mx+c
 1 = m * idx * stripeProgressLength + c
 0 = m * idx * stripeProgressLength + m * stripeProgressLength + c
 
 1 = -m * stripeProgressLength
 m = -1 / stripeProgressLength
 c = 1 + idx
 
 */
