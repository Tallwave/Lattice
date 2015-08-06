//
//  NextFieldBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/6/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class NextFieldBehavior: TextFieldBehavior {
    @IBOutlet weak var destinationControl: UIView!

    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        destinationControl.becomeFirstResponder()
        return false
    }
}
