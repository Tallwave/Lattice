//
//  PostValidationSegueAction.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    An action performed after Validation that performs a segue.
*/
public class PostValidationSegueAction: PostValidationAction {
    /**
    The name of the segue to perform.
    */
    @IBInspectable var segueIdentifier: String?

    /**
    A controller is needed to perform a segue. This might be the same as the `owner` as defined by the Behavior, but may not.
    */
    @IBOutlet weak var controller: UIViewController!
    
    public override func performAction(forValidators validators: [Validator]? = nil) {
        if let segueIdentifier = self.segueIdentifier, controller = self.controller {
            controller.performSegueWithIdentifier(segueIdentifier, sender: nil)
        }
    }
}
