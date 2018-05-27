//
//  Animator.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/18/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public protocol Animator {
    func update(progress: CGFloat, for slices: [Slice])
}
