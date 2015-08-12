//
//  NumberValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Checks if text is a valid number. Note that this is *not* localized. Some languages use  a comma (',') instead of a period to denote a decimal. Maybe V2?
*/
public class NumberValidator: BaseRegularExpressionValidator {
    @IBInspectable var allowDecimal: Bool = true
    @IBInspectable var allowNegative: Bool = true
    
    override var pattern: String {
        get {
            var defaultPattern = "[\\d]+"
            if allowDecimal { defaultPattern = "([\\d]+)?(\\.[\\d]+)?" }
            if allowNegative { defaultPattern = "-?\(defaultPattern)" }
            defaultPattern = "^\(defaultPattern)$"
            return defaultPattern
        }
        set {}
    }
}
