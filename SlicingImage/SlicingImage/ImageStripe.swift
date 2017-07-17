//
//  ImageStripe.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/17/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class ImageStripe: UIView {
    
    public let imageView: UIImageView = UIImageView()
    public let index: Int
    public let totalCount: Int
    public let direction: SlicingDirection
    
    public init(with image: UIImage, at index: Int, forTotalCount totalCount: Int, inDirection direction: SlicingDirection) {
        self.index = index
        self.totalCount = totalCount
        self.direction = direction
        super.init(frame: .zero)
        setupView(with: image)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutImage()
    }
    
    private func setupView(with image: UIImage) {
        imageView.image = image
        addSubview(imageView)
        clipsToBounds = true
    }
    
    private func layoutImage() {
        switch direction {
        case .vertical:
            imageView.frame.origin.y = -CGFloat(index) * bounds.height
            imageView.frame.size = CGSize(width: bounds.width, height: CGFloat(totalCount) * bounds.height)
        case .horizontal:
            imageView.frame.origin.x = -CGFloat(index) * bounds.width
            imageView.frame.size = CGSize(width: CGFloat(totalCount) * bounds.width, height: bounds.height)
        }
    }
}
