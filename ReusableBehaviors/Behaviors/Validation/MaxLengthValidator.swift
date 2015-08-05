//
//  MaxLengthValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Validates that a text control has a maximum text length.
*/
public class MaxLengthValidator: TextControlValidator {
    @IBInspectable var maximumLength: Int = 0
    
    override func validateText(text: String) -> Bool {
        return count(text) <= maximumLength
    }
}
