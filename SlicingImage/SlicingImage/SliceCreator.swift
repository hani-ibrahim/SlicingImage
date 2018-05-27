//
//  SliceCreator.swift
//  SlicingImage
//
//  Created by Hani on 27.05.18.
//  Copyright © 2018 Hani Ibrahim. All rights reserved.
//

import UIKit

public protocol SliceCreator {
    func createSlices(from views: [UIView]) -> [Slice]
}
