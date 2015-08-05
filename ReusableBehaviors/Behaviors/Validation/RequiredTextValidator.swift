//
//  RequiredTextValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class RequiredTextValidator: Validator {
    @IBInspectable var trimText: Bool = true
    
    override func validate() -> Bool {
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
        let textToValidate = trimText ? text.stringByTrimmingWhitespace() : text
        return count(textToValidate) > 0
    }
}
