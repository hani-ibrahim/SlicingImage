//
//  SlicingImage.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class SlicingImage: UIView {

    public private(set) var sliceImageViews: [UIImageView] = []
    public var imageDivider: ImageDivider?
//    public var animator: Animator?
    
    public func configure(for image: UIImage, into count: Int) {
        sliceImageViews.forEach { $0.removeFromSuperview() }
        sliceImageViews = imageDivider?.divide(image: image, into: count, inTotalSize: bounds.size).map { slice in
            let imageView = UIImageView(frame: slice.frame)
            imageView.image = slice.image
            addSubview(imageView)
            return imageView
        } ?? []
        
    }
}
