//
//  ScreenValidator.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class ScreenValidator: UIControl {
    @IBOutlet public var validators: [Validator]?

    @IBAction public func validate(sender: AnyObject) {
        if let invalidResults = validators?.filter({ !$0.validate() }) {
            sendInvalidResults(invalidResults)
        }
    }
    
    private func sendInvalidResults(invalidResults: [Validator]) {
        sendActionsForControlEvents(.ValueChanged)
    }
}
