//
//  EmailTextValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class EmailTextValidator: RegularExpressionValidator {
    private let _pattern = "^\\S+@\\S+\\.\\S+$"
    @IBInspectable override var pattern: String {
        get { return _pattern }
        set {}
    }
}
