//
//  InputAccessoryBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 7/25/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Buttons can be left or right aligned.
*/
public enum ToolbarButtonAlignment {
    case Left, Right
}

/**
    Display a list of buttons above the keyboard for a `UITextView` or `UITextField`.
*/
public class InputAccessoryBehavior: Behavior {

    /**
    Buttons can be left or right aligned.
    */
    @IBInspectable var buttonAlignment: ToolbarButtonAlignment = .Right

    /**
    The textview that has the button bar.
    */
    @IBOutlet public weak var textview: UITextView? {
        didSet {
            textview?.inputAccessoryView = createAccessoryView()
        }
    }

    /**
    The textfield that has the button bar.
    */
    @IBOutlet public weak var textField: UITextField? {
        didSet {
            textField?.inputAccessoryView = createAccessoryView()
        }
    }

    /**
    The buttons to display. This is expected to be implemented by subclasses.
    */
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
