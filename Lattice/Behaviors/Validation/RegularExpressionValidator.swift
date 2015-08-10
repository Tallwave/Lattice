//
//  RegularExpressionValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class RegularExpressionValidator: TextControlValidator {
    @IBInspectable var pattern: String = ""
    
    override func validateText(text: String) -> Bool {
        if count(text) == 0 { return super.validateText(text) }
        if let match = text.rangeOfString(pattern, options: .RegularExpressionSearch) {
            return true
        }
        return false
    }
}
