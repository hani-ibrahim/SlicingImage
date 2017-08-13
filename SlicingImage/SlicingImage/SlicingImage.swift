//
//  SlicingImage.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class SlicingImage: UIView {

    public private(set) var sliceViews: [UIView] = []
    public var imageDivider: ImageDivider?
    public var animator: Animator?
    
    public func configure(for image: UIImage, into count: Int) {
        sliceViews.forEach { $0.removeFromSuperview() }
        sliceViews = imageDivider?.divide(image: image, into: count, inTotalSize: bounds.size) ?? []
        sliceViews.forEach { addSubview($0) }
    }
    
    public func update(progress: CGFloat, duration: TimeInterval = 0) {
        animator?.update(progress: progress, for: sliceViews, duration: duration)
    }
}
