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
    public var animators: [Animator] = []
    
    public func configure(for image: UIImage, into count: Int) {
        let slicesViews = imageDivider?.divide(image: image, into: count, inTotalSize: bounds.size) ?? []
        slices.forEach { $0.view.removeFromSuperview() }
        slices = sliceCreator?.createSlices(from: slicesViews) ?? []
        slices.forEach { addSubview($0.view) }
    }
    
    public func update(progress: CGFloat, duration: TimeInterval = 0) {
        if duration == 0 {
            updateAnimators(with: progress)
        } else {
            UIView.animate(withDuration: duration) {
                self.updateAnimators(with: progress)
            }
        }
    }
    
    private func updateAnimators(with progress: CGFloat) {
        animators.forEach{ $0.update(progress: progress, for: slices) }
    }
}
