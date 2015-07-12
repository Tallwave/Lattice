//
//  IconTextField.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

private let iconLeftMarginSize:     CGFloat = 8
private let textLeftOffsetFromIcon: CGFloat = 12

@IBDesignable public class IconTextField: UITextField {

    @IBInspectable var icon: UIImage?
    
    private var iconImageView: UIImageView?
    
    // MARK: - Overrides
    override func layoutSubviews() {
        if let icon = icon {
            let y = bounds.midY - (icon.size.height / 2)
            let imageFrame = CGRect(origin: CGPoint(x: iconLeftMarginSize, y: y), size: icon.size)
            iconImageView = UIImageView(frame: imageFrame)
            iconImageView?.contentMode = .ScaleAspectFit
            iconImageView?.image = icon
            addSubview(iconImageView!)
        } else {
            iconImageView?.removeFromSuperview()
            iconImageView = nil
        }
    }

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        if let iconImageView = self.iconImageView {
            let xPos = iconImageView.frame.maxX + textLeftOffsetFromIcon
            return CGRect(x: xPos, y: 0, width: bounds.width - textLeftOffsetFromIcon, height: bounds.height)
        }
        return super.textRectForBounds(bounds)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
}
