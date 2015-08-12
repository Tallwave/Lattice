//
//  TextFieldMaxLengthBehavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Ensures that the text of the associated `UITextField` does not exceed 
`maxLength`.
*/
public class TextFieldMaxLengthBehavior: TextFieldBehavior {
    /**
    Maximum length the text should be.
    */
    @IBInspectable public var maxLength: Int = 0
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if maxLength == 0 { return true }
        let oldLength = count(textField.text)
        let replacementLength = count(string)

        let newLength = oldLength - range.length + replacementLength
        let hasNewLine = contains(string, "\n")
        return newLength <= maxLength || hasNewLine
    }
}
