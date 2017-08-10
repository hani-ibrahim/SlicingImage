//
//  ImageStripeDivider.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 8/10/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public struct ImageStripeDivider {
    
    public enum Direction {
        case vertical
        case horizontal
    }
}

extension ImageStripeDivider: ImageDivider {
    
    public func divide(image: UIImage, into count: Int) -> [UIImage] {
        return []
    }
}
