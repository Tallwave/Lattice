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
        if let text = textField.text {
            let oldLength = text.characters.count
            let replacementLength = string.characters.count

            let newLength = oldLength - range.length + replacementLength
            let hasNewLine = string.characters.contains("\n")
            return newLength <= maxLength || hasNewLine
        }
        return true
    }
}
