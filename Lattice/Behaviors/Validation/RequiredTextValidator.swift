//
//  RequiredTextValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Makes sure that a text control has text in it. Works on either a `UITextField` or `UITextView`.
*/
public class RequiredTextValidator: TextControlValidator {
    /**
    Allows for empty text to pass validation. `false` by default.
    */
    @IBInspectable var trimEndsOfText: Bool = true
    
    override func validateText(text: String) -> Bool {
        let textToValidate = trimEndsOfText ? text.stringByTrimmingWhitespace() : text
        return count(textToValidate) > 0
    }
}
