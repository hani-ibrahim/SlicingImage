//
//  SlicingImage.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public enum SlicingDirection {
    case vertical
    case horizontal
}

public class SlicingImage: UIView {

    public private(set) var stripes: [ImageStripe] = []
    public private(set) var direction: SlicingDirection = .vertical
    public var animator: Animator? {
        didSet {
            setupAnimator()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    public func configure(for image: UIImage, into count: Int, inDirection direction: SlicingDirection) {
        stripes.forEach { $0.removeFromSuperview() }
        stripes = (0..<count).map { index in
            let imageStripe = ImageStripe(with: image, at: index, forTotalCount: count, inDirection: direction)
            addSubview(imageStripe)
            return imageStripe
        }
        self.direction = direction
        setupAnimator()
        updateLayout()
    }
    
    public func update(progress: CGFloat) {
        animator?.progress = progress
    }
    
    private func setupAnimator() {
        animator?.stripes = stripes
        animator?.direction = direction
    }
    
    private func updateLayout() {
        // Note: UIStackView doesn't work here as it doesn't provide exact equal height for vertical layout even with `fillEqually`
        //       That's because it approximate decimal values
        //       So I have to calculate the size to have precise dimensions
        
        let count = CGFloat(stripes.count)
        for (idx, stripe) in stripes.enumerated() {
            switch direction {
            case .vertical:
                stripe.frame.size = CGSize(width: bounds.width, height: bounds.height / count)
                stripe.frame.origin = CGPoint(x: 0, y: CGFloat(idx) * stripe.frame.size.height)
            case .horizontal:
                stripe.frame.size = CGSize(width: bounds.width / count, height: bounds.height)
                stripe.frame.origin = CGPoint(x: CGFloat(idx) * stripe.frame.size.width, y: 0)
            }
        }
    }
}
