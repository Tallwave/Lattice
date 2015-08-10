//
//  TextControlValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Base class for all Text Control validators. Accepts a `UITextField` or `UITextView`.
*/
public class TextControlValidator: Validator {
    public override func validate() -> Bool {
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
    
    func validateText(text: String) -> Bool {
        return true
    }
}
