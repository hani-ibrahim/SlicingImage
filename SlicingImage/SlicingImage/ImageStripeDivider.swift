//
//  ImageStripeDivider.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 8/10/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public struct ImageStripeDivider {
    
    public var direction: Direction = .vertical
    
    public enum Direction {
        case vertical
        case horizontal
    }
}

extension ImageStripeDivider: ImageDivider {
    
    public func divide(image: UIImage, into count: Int, inTotalSize totalSize: CGSize) -> [UIView] {
        guard let cgImage = image.cgImage else { return [] }
        let cgImageSize = CGSize(width: CGFloat(cgImage.width), height: CGFloat(cgImage.height))
        
        let images: [UIView] = (0..<count).map { index in
            let croppingFrame = frame(for: index, of: count, inTotalSize: cgImageSize)
            let displayedFrame = frame(for: index, of: count, inTotalSize: totalSize)
            
            guard let croppedImage = cgImage.cropping(to: croppingFrame) else { return nil }
            let imageView = UIImageView(frame: displayedFrame)
            imageView.image = UIImage(cgImage: croppedImage)
            return imageView
        }.flatMap { $0 }
        
        return images
    }
    
    private func frame(for index: Int, of count: Int, inTotalSize totalSize: CGSize) -> CGRect {
        var frame = CGRect(origin: .zero, size: totalSize)
        
        switch direction {
        case .vertical:
            frame.size.height = totalSize.height / CGFloat(count)
            frame.origin.y = CGFloat(index) * frame.size.height
        case .horizontal:
            frame.size.width = totalSize.width / CGFloat(count)
            frame.origin.x = CGFloat(index) * frame.size.width
        }
        
        return frame
    }
}