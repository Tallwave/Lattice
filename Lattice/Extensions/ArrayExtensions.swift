//
//  ArrayExtensions.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

extension Array {
    /**
    Returns true if every element within the array is true for `fn`.
    */
    func all(fn: (Element) -> Bool) -> Bool {
        for obj in self {
            if !fn(obj) {
                return false
            }
        }
        return true
    }
}
