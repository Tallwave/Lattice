//
//  TextFieldNumericMaskBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 8/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Wraps the `NumberMasker` class into a Behavior. Converts the `text` of the `TextField` to a format defined in `pattern`.
*/
public class TextFieldNumericMaskBehavior: TextFieldBehavior {
    /**
    The pattern `NumberMasker` uses to format the `text`.
    */
    @IBInspectable public var pattern: String = ""
    let masker = NumberMasker()

    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        let beginning = textField.beginningOfDocument
        let start = textField.positionFromPosition(beginning, offset: range.location)!

        let oldString = textField.text as NSString
        let text = oldString.stringByReplacingCharactersInRange(range, withString: string)
        textField.text = mask(text)

        var diff = count(textField.text) - oldString.length
        if diff < 0 { diff = 0 }
        let newCursorPosition = textField.positionFromPosition(start, offset: diff)
        let newSelectedRange = textField.textRangeFromPosition(newCursorPosition, toPosition: newCursorPosition)
        textField.selectedTextRange = newSelectedRange
        return false
    }
    
    public func mask(text: String) -> String {
        return masker.mask(text, withPattern: pattern)
    }
}
