//
//  Animator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/18/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public protocol Animator: class {
    var stripes: [ImageStripe] { get set }
    var direction: SlicingDirection { get set }
    var progress: CGFloat { get set }
}
