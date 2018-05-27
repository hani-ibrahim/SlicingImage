//
//  SlicingImage.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class SlicingImage: UIView {

    public private(set) var slices: [Slice] = []
    public var imageDivider: ImageDivider?
    public var sliceCreator: SliceCreator?
    public var animator: Animator?
    
    public func configure(for image: UIImage, into count: Int) {
        let slicesViews = imageDivider?.divide(image: image, into: count, inTotalSize: bounds.size) ?? []
        slices.forEach { $0.view.removeFromSuperview() }
        slices = sliceCreator?.createSlices(from: slicesViews) ?? []
        slices.forEach { addSubview($0.view) }
    }
    
    public func update(progress: CGFloat, duration: TimeInterval = 0) {
        if duration == 0 {
            animator?.update(progress: progress, for: slices)
        } else {
            UIView.animate(withDuration: duration) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.animator?.update(progress: progress, for: strongSelf.slices)
            }
        }
    }
}
