//
//  ImageStripeDivider.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 8/10/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public class ImageStripeDivider {
    
    private let direction: Direction

    public enum Direction {
        case vertical
        case horizontal
    }
    
    public init(direction: Direction) {
        self.direction = direction
    }
}

extension ImageStripeDivider: ImageDivider {
    public func divide(image: UIImage, into count: Int, inTotalSize totalSize: CGSize) -> [UIView] {
        guard let cgImage = image.cgImage else { return [] }
        let cgImageSize = CGSize(width: CGFloat(cgImage.width), height: CGFloat(cgImage.height))
        
        return (0..<count).map { index in
            let croppingFrame = frame(for: index, of: count, inTotalSize: cgImageSize)
            let displayedFrame = frame(for: index, of: count, inTotalSize: totalSize)
            
            guard let croppedImage = cgImage.cropping(to: croppingFrame) else { return nil }
            let imageView = UIImageView(frame: displayedFrame)
            imageView.image = UIImage(cgImage: croppedImage)
            return imageView
        }.compactMap { $0 }
    }
    
    private func frame(for index: Int, of count: Int, inTotalSize totalSize: CGSize) -> CGRect {
        switch direction {
        case .vertical:
            let height = totalSize.height / CGFloat(count)
            return CGRect(x: 0, y: CGFloat(index) * height, width: totalSize.width, height: height)
        case .horizontal:
            let width = totalSize.width / CGFloat(count)
            return CGRect(x: CGFloat(index) * width, y: 0, width: width, height: totalSize.height)
        }
    }
}
