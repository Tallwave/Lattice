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
        let frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 44)
        let menu = UIToolbar(frame: frame)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneTapped:")
        menu.items = [doneButton]
        return menu
    }
    
    func doneTapped(sender: AnyObject) {
        textview?.resignFirstResponder()
    }
}
