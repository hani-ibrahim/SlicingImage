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
    
    public func divide(image: UIImage, into count: Int, inTotalSize totalSize: CGSize) -> [ImageSlice] {
        let images: [ImageSlice] = (0..<count).map { index in
            let croppingFrame = frame(for: index, of: count, inTotalSize: totalSize)
            let displayedFrame = frame(for: index, of: count, inTotalSize: totalSize)
            
            guard let croppedImage = image.cgImage?.cropping(to: croppingFrame) else { return nil }
            return ImageSlice(image: UIImage(cgImage: croppedImage), index: index, frame: displayedFrame)
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
