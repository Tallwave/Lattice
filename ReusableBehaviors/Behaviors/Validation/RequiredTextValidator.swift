//
//  RequiredTextValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Makes sure that a text control has text in it. Works on either a `UITextField` or `UITextView`.
*/
public class RequiredTextValidator: Validator {
    /**
    Allows for empty text to pass validation. `false` by default.
    */
    @IBInspectable var acceptBlankText: Bool = false
    
    override public func validate() -> Bool {
        if let textfield = view as? UITextField {
            return validateTextField(textfield)
        } else if let textview = view as? UITextView {
            return validateTextView(textview)
        }
        return super.validate()
    }
    
    private func validateTextField(textfield: UITextField) -> Bool {
        return validateText(textfield.text)
    }
    
    private func validateTextView(textview: UITextView) -> Bool {
        return validateText(textview.text)
    }
    
    private func validateText(text: String) -> Bool {
        let textToValidate = acceptBlankText ? text : text.stringByTrimmingWhitespace()
        return count(textToValidate) > 0
    }
}
