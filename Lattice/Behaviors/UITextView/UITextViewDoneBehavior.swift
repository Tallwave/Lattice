//
//  UITextViewDoneBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 7/24/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Displays a Done button on a `UIToolbar` serving as an `inputAccessView` on the `UITextView`.
*/
public class UITextViewDoneBehavior: InputAccessoryBehavior {

    override func createToolbarButtons() -> [UIBarButtonItem] {
        return [UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneTapped:")]
    }
    
    func doneTapped(sender: AnyObject) {
        textview?.resignFirstResponder()
    }
}
