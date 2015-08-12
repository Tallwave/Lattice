//
//  StringExtensions.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

extension String {
    /**
    Trims all the whitespace at the beginning and end of a string.
    */
    func stringByTrimmingWhitespace() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }

    /**
    True if the string is a number.
    */
    func isDigit() -> Bool {
        let components = self.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet())
        return components.filter({ !$0.isEmpty }).count == 0
    }
}
