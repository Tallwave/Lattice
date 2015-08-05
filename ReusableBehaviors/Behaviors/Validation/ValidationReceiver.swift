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
    var successHandler: ValidationAction? { get set }
    
}

public class ValidationReceiverTransition: NSObject, ValidationReceiver {
    @IBOutlet public weak var successHandler: ValidationAction?
    
    @IBAction public func validationUpdated(sender: ValidatorContainer) {
        if sender.isValid {
            success()
        } else {
            failure()
        }
    }
    
    private func success() {
        if let handler = successHandler {
            handler.performAction(forValidators: nil)
        }
    }
    
    private func failure() {
        
    }
}

@objc public protocol ValidationAction {
    func performAction(forValidators validators: [Validator]?)
}

public class SegueTransitioner: ValidationAction {
    @IBInspectable var segueIdentifier: String?
    @IBOutlet weak var controller: UIViewController!
    
    @objc public func performAction(forValidators validators: [Validator]? = nil) {
        if let segueIdentifier = self.segueIdentifier, controller = self.controller {
            controller.performSegueWithIdentifier(segueIdentifier, sender: nil)
        }
    }
}
