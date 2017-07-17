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
    public let direction: SlicingDirection
    
    public init(with image: UIImage, inContainerSize size: CGSize, at index: Int, inDirection direction: SlicingDirection) {
        self.index = index
        self.direction = direction
        super.init(frame: .zero)
        setupView(with: image, inContainerSize: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutImage()
    }
    
    private func setupView(with image: UIImage, inContainerSize size: CGSize) {
        imageView.frame = CGRect(origin: .zero, size: size)
        imageView.image = image
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(imageView)
        clipsToBounds = true
    }
    
    private func layoutImage() {
        switch direction {
        case .vertical: imageView.frame.origin.y = -CGFloat(index) * bounds.height
        case .horizontal: imageView.frame.origin.x = -CGFloat(index) * bounds.width
        }
    }
}
