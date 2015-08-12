//
//  NextFieldBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 8/6/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Tells which view should be the next first responder.
*/
public class NextFieldBehavior: TextFieldBehavior {
    /**
    The view that will be the next first responder.
    */
    @IBOutlet weak var destinationView: UIView!

    /**
    Resigns the first responder from the current textfield and then tells the `destinationView` to become first responder.
    */
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        destinationView.becomeFirstResponder()
        return false
    }
}
