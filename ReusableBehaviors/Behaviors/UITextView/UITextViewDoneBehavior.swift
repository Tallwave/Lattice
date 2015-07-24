//
//  UITextViewDoneBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/24/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class UITextViewDoneBehavior: Behavior {
    
    @IBOutlet public weak var textview: UITextView? {
        didSet {
            textview?.inputAccessoryView = createAccessoryView()
        }
    }
    
    private func createAccessoryView() -> UIView {
        let toolbar = AccessoryBar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneTapped:")
        toolbar.items = [doneButton]
        return toolbar
    }
    
    func doneTapped(sender: AnyObject) {
        textview?.resignFirstResponder()
    }
}
