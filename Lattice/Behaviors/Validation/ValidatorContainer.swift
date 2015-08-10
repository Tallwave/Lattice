//
//  ScreenValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit


// I would love to be able to refactor a protocol out of this, but the argument that is passed along with the `ValueChanged` event must be a class, so there's not really a point.
public class ValidatorContainer: BehaviorControl {
    @IBOutlet public var validators: [Validator]?
    
    public private(set) var failingValidators: [Validator] = []
    
    public var isValid: Bool {
        return failingValidators.count == 0
    }

    @IBAction public func validate(sender: AnyObject) {
        let invalidResults = validators?.filter({ !$0.validate() })
        sendResults(invalidResults ?? [])
    }
    
    private func sendResults(invalidResults: [Validator]) {
        failingValidators = invalidResults
        sendActionsForControlEvents(.ValueChanged)
    }
}
