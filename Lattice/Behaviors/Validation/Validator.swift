//
//  ValidatorProtocol.swift
//  Lattice
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

    /**
    The base validator class. A `Validator` acts on a single view. The `validate` method determines whether the `view` is valid or not.

    Multiple validators can be added to a scene with the `ValidatorContainer` class.

    NOTES:
    Must be a class and extend NSObject in order to be used in Interface Builder. The @objc keyword compiles, but Xcode complains a lot if you do it that way.
    */
public class Validator: NSObject {
    /**
    The view to validate.
    */
    @IBOutlet weak var view: UIView!
    /**
    The message that will be used when `validate` fails.
    */
    @IBInspectable var errorMessage: String = ""

    /**
    Determines whether the `view` is valid or not. A `Validator` should only validate on a single piece of logic. For example, one validator should check if a textfield is required and another should check if it is shortern than X characters.
    */
    public func validate() -> Bool {
        return true
    }
}
