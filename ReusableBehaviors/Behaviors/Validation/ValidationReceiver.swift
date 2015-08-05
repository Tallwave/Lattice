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
    
}

public class ValidationReceiverTransition: Behavior, ValidationReceiver {
    @IBOutlet public weak var successAction: ValidationAction?
    
    @IBAction public func validationUpdated(sender: ValidatorContainer) {
        if sender.isValid {
            success()
        } else {
            failure()
        }
    }
    
    private func success() {
        if let handler = successAction {
            handler.performAction(forValidators: nil)
        }
    }
    
    private func failure() {
        println("FAILURE")
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
