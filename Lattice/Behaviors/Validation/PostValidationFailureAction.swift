//
//  PostValidationFailureAction.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Base class for handling Validation failures.
*/
public class PostValidationFailureAction: PostValidationAction {
    /**
    Displays an optional list of failing validators.
    */
    public override func performAction(forValidators validators: [Validator]?) {
        if let failingValidators = validators {
            displayFailures(failingValidators)
        }
    }

    /**
    Displays a list of failing validators.
    */
    public func displayFailures(failingValidators: [Validator]) {
        for validator in failingValidators {
            displayFailure(validator)
        }
    }

    /**
    Display a single failing validator. Not implemented on the base class.
    */
    public func displayFailure(validator: Validator) {
    }
}

/**
    A lame example that just displays all error messages in an alert. 
*/
public class PostValidationFailureAlertAction: PostValidationFailureAction {
    @IBOutlet weak var controller: UIViewController!

    /**
    Display the validation errors in a `UIAlertController`.
    */
    override public func displayFailures(failingValidators: [Validator]) {
        let errorMessage = join("\n", failingValidators.map({ $0.errorMessage }))
        let alert = UIAlertController(title: "Validation Errors", message: errorMessage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}
