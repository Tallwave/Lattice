//
//  StringExtensions.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

extension String {
    func stringByTrimmingWhitespace() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}
