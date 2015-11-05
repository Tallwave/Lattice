//
//  BaseRegularExpressionValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    A `Validator` that validates a text control based on a regular expression.
*/
public class BaseRegularExpressionValidator: TextControlValidator {
    var pattern: String = ""

    /**
    True if the `text` passes the `pattern` regular expression.
    */
    override func validateText(text: String) -> Bool {
        if text.characters.count == 0 { return super.validateText(text) }
        if let _ = text.rangeOfString(pattern, options: .RegularExpressionSearch) {
            return true
        }
        return false
    }
}
