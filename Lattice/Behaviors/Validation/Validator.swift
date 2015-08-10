//
//  ValidatorProtocol.swift
//  Lattice
//
//  Created by Scott Williams on 8/4/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

// The base validator class. Must be a class and extend NSObject in order to be used in Interface Builder. The @objc keyword compiles, but Xcode complains a lot if you do it that way.
public class Validator: NSObject {
    @IBOutlet weak var view: UIView!
    @IBInspectable var errorMessage: String = ""
    
    public func validate() -> Bool {
        return true
    }
}
