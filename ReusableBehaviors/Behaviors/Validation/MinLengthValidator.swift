//
//  MinLengthValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class MinLengthValidator: TextControlValidator {
    @IBInspectable var minimumLength: Int = 0
    
    override func validateText(text: String) -> Bool {
        return count(text) >= minimumLength
    }
}
