//
//  ImageDivider.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 8/10/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public struct ImageSlice {
    let image: UIImage
    let index: Int
    let frame: CGRect
}

public protocol ImageDivider {
    func divide(image: UIImage, into count: Int, inTotalSize totalSize: CGSize) -> [ImageSlice]
}
