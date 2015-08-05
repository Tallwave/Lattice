//
//  ValidationAction.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    An encapsulation of some kind of action that will happen after Validation has been performed. Similar to the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern).
    
    Ideally this would be a protocol, but Interface Builder doesn't like protocols.
*/
public class PostValidationAction: Behavior {
    /**
    Runs an action with the associated validators. Not implemented on the base class.
    */
    func performAction(forValidators validators: [Validator]?) {
    }
}
