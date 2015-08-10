//
//  PostValidationTransitioner.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Handles the results of validation. The `ValidatorContainer` fires the 
`ValueChanged` event, which can be be tied to the `validationUpdated` action 
here. The transitioner has a success and failure path that are encapsulated by 
`PostValidationAction`s.
*/
public class PostValidationTransitioner: Behavior, ValidationReceiver {
    /**
    What happens when validation is successful.
    */
    @IBOutlet public weak var successAction: PostValidationAction?

    /**
    What happens when validation fails.
    */
    @IBOutlet public weak var failureAction: PostValidationAction?
    
    @IBAction public func validationUpdated(sender: ValidatorContainer) {
        if sender.isValid {
            success()
        } else {
            failure(sender.failingValidators)
        }
    }
    
    // MARK: - Implementations
    
    // These are private because you should customize by subclassing 
    // `PostValidationAction` and setting it here.
    
    private func success() {
        if let handler = successAction {
            handler.performAction(forValidators: nil)
        }
    }
    
    private func failure(failingValidators: [Validator]) {
        if let handler = failureAction {
            handler.performAction(forValidators: failingValidators)
        }
    }
}

