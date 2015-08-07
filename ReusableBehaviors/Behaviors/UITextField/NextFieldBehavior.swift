//
//  NextFieldBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/6/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Tells which view should be the first responder next.
*/
public class NextFieldBehavior: TextFieldBehavior {
    @IBOutlet weak var destinationView: UIView!

    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        destinationView.becomeFirstResponder()
        return false
    }
}
