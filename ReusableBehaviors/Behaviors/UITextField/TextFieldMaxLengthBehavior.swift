//
//  TextFieldMaxLengthBehavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

public class TextFieldMaxLengthBehavior: TextFieldBehavior {
    @IBInspectable var maxLength: Int = 0
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if maxLength == 0 { return true }
        let oldLength = count(textField.text)
        let replacementLength = count(string)

        let newLength = oldLength - range.length + replacementLength
        let hasNewLine = contains(string, "\n")
        return newLength <= maxLength || hasNewLine
    }
}
