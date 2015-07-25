//
//  InputAccessoryBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/25/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public enum ToolbarButtonAlignment {
    case Left, Right
}

public class InputAccessoryBehavior: Behavior {

    @IBInspectable var buttonAlignment: ToolbarButtonAlignment = .Right

    @IBOutlet public weak var textview: UITextView? {
        didSet {
            textview?.inputAccessoryView = createAccessoryView()
        }
    }

    func createToolbarButtons() -> [UIBarButtonItem] {
        return []
    }

    private func createAccessoryView() -> AccessoryBar {
        let toolbar = AccessoryBar()
        var buttons = createToolbarButtons()
        if buttonAlignment == .Right {
            let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            buttons.insert(spacer, atIndex: 0)
        }
        toolbar.items = buttons
        return toolbar
    }
}
