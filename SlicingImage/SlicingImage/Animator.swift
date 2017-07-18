//
//  Animator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/18/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public protocol Animator {
    var stripes: [ImageStripe] { get set }
    var direction: SlicingDirection { get set }
    
    func update(progress: CGFloat)
}
