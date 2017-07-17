//
//  SlicingImage.swift
//  SlicingImage
//
//  Created by Hani Ibrahim on 7/15/17.
//  Copyright © 2017 Hani Ibrahim. All rights reserved.
//

import UIKit

public enum SlicingDirection {
    case vertical
    case horizontal
    
    fileprivate var stackViewAxis: UILayoutConstraintAxis {
        switch self {
        case .vertical: return .vertical
        case .horizontal: return .horizontal
        }
    }
}

public class SlicingImage: UIView {

    public private(set) var stripes: [ImageStripe] = []
    private let stackView: UIStackView = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStackView()
    }
    
    public func configure(for image: UIImage, into count: Int, inDirection direction: SlicingDirection) {
        prepareStackView(for: direction)
        stripes = (0..<count).map { index in
            let imageStripe = ImageStripe(with: image, inContainerSize: bounds.size, at: index, inDirection: direction)
            stackView.addArrangedSubview(imageStripe)
            return imageStripe
        }
    }
    
    private func setupStackView() {
        guard stackView.superview == nil else { return }
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        addSubview(stackView)
        stackView.frame = bounds
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func prepareStackView(for direction: SlicingDirection) {
        stackView.arrangedSubviews.forEach { stackView.removeArrangedSubview($0) }
        stackView.axis = direction.stackViewAxis
    }
}
