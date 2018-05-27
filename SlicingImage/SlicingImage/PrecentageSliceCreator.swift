//
//  PrecentageSliceCreator.swift
//  SlicingImage
//
//  Created by Hani on 27.05.18.
//  Copyright © 2018 Hani Ibrahim. All rights reserved.
//

import UIKit

public class PrecentageSliceCreator {
    
    private let sliceStartShift: CGFloat
    private let sliceEndShift: CGFloat
    
    public init(sliceStartShift: CGFloat, sliceEndShift: CGFloat) {
        self.sliceStartShift = sliceStartShift
        self.sliceEndShift = sliceEndShift
    }
}

extension PrecentageSliceCreator: SliceCreator {
    public func createSlices(from views: [UIView]) -> [Slice] {
        return views
            .enumerated()
            .map { (index, view) in
                let idx = CGFloat(index)
                let count = CGFloat(views.count)
                let minRange = max(0, (idx - sliceStartShift) / count)
                let maxRange = min(1, (idx + 1 + sliceEndShift) / count)
                return Slice(view: view, progressRange: minRange...maxRange)
        }
    }
}
