//
//  ScreenValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Handles all the validators for a scene. Extends `BehaviorControl` so that another object can receive actions for the `ValidatorContainer`.

    ## Usage 
    1. Connect all the validators to the `validators` array.
    2. Connect an `IBAction` to the `validate` method.
    3. Connect the `ValueChanged` event to another object (one of your choosing, or consider a `PostValidationAction`.

    NOTES:
    I would love to be able to refactor a protocol out of this, but the argument that is passed along with the `ValueChanged` event must be a class, so there's not really a point.
*/
public class ValidatorContainer: BehaviorControl {
    /**
    All the validators for a single scene.
    */
    @IBOutlet public var validators: [Validator]?

    /**
    Once validation runs this array contains all of the validators that did not pass.
    */
    public private(set) var failingValidators: [Validator] = []

    /**
    True if validation passed.
    */
    public var isValid: Bool {
        return failingValidators.count == 0
    }

    /**
    Runs all of the `validators` for the scene. The `ValueChanged` event is triggered on completion.
    */
    @IBAction public func validate(sender: AnyObject) {
        let invalidResults = validators?.filter({ !$0.validate() })
        sendResults(invalidResults ?? [])
    }
    
    private func sendResults(invalidResults: [Validator]) {
        failingValidators = invalidResults
        sendActionsForControlEvents(.ValueChanged)
    }
}
