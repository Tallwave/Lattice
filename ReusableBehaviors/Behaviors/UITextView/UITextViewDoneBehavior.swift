//
//  UITextViewDoneBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/24/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class UITextViewDoneBehavior: InputAccessoryBehavior {

    override func createToolbarButtons() -> [UIBarButtonItem] {
        return [UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneTapped:")]
    }
    
    func doneTapped(sender: AnyObject) {
        textview?.resignFirstResponder()
    }
}
