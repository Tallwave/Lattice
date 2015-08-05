//
//  ValidationReceiver.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public protocol ValidationReceiver {
    func validationUpdated(sender: ValidatorContainer)
    var successAction: ValidationAction? { get set }
    var failureAction: ValidationAction? { get set }
}

public class PostValidationTransitioner: Behavior, ValidationReceiver {
    @IBOutlet public weak var successAction: ValidationAction?
    @IBOutlet public weak var failureAction: ValidationAction?
    
    @IBAction public func validationUpdated(sender: ValidatorContainer) {
        if sender.isValid {
            success()
        } else {
            failure(sender.failingValidators)
        }
    }
    
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

public class ValidationAction: Behavior {
    func performAction(forValidators validators: [Validator]?) {
    }
}

public class SegueTransitioner: ValidationAction {
    @IBInspectable var segueIdentifier: String?
    @IBOutlet weak var controller: UIViewController!
    
    public override func performAction(forValidators validators: [Validator]? = nil) {
        if let segueIdentifier = self.segueIdentifier, controller = self.controller {
            controller.performSegueWithIdentifier(segueIdentifier, sender: nil)
        }
    }
}

public class BaseValidationFailureTransitioner: ValidationAction {
    public override func performAction(forValidators validators: [Validator]?) {
        if let failingValidators = validators {
            displayFailures(failingValidators)
        }
    }
    
    func displayFailures(failingValidators: [Validator]) {
        for validator in failingValidators {
            displayFailure(validator)
        }
    }
    
    func displayFailure(validator: Validator) {
    }
}

public class AlertValidationFailureTransitioner: BaseValidationFailureTransitioner {
    @IBOutlet weak var controller: UIViewController!
    
    override func displayFailures(failingValidators: [Validator]) {
        let errorMessage = join("\n", failingValidators.map({ $0.errorMessage }))
        let alert = UIAlertController(title: "Validation Errors", message: errorMessage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}
