//
//  ScreenValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class ScreenValidator: BehaviorControl {
    @IBOutlet public var validators: [Validator]?
    
    public private(set) var failingValidators: [Validator] = []

    @IBAction public func validate(sender: AnyObject) {
        if let invalidResults = validators?.filter({ !$0.validate() }) {
            sendResults(invalidResults)
        } else {
            sendResults([])
        }
    }
    
    private func sendResults(invalidResults: [Validator]) {
        failingValidators = invalidResults
        sendActionsForControlEvents(.ValueChanged)
    }
}
