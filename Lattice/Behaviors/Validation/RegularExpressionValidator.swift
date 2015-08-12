//
//  RegularExpressionValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    The same as `BaseRegularExpressionValidator` but exposes the `pattern` as an `IBInspectable`.
*/
public class RegularExpressionValidator: BaseRegularExpressionValidator {
    @IBInspectable override var pattern: String {
        get { return super.pattern }
        set { super.pattern = newValue }
    }
}
