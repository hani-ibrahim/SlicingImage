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
    
    public init(with image: UIImage, at index: Int, inDirection direction: SlicingDirection) {
        self.index = index
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
    
    func update(containerSize: CGSize) {
        imageView.frame.size = containerSize
    }
    
    private func setupView(with image: UIImage) {
        imageView.image = image
        addSubview(imageView)
        clipsToBounds = true
    }
    
    private func layoutImage() {
        switch direction {
        case .vertical: imageView.frame.origin.y = -CGFloat(index) * bounds.height
        case .horizontal: imageView.frame.origin.x = -CGFloat(index) * bounds.width
        }
        print("imageView.frame: \(imageView.frame), superview!.frame: \(superview!.frame.size), bounds.size: \(bounds.size)")
    }
}
