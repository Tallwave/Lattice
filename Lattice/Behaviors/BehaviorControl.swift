//
//  BehaviorControl.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Ok. Some behaviors would greatly benefit from having some of the 
functionality defined by `UIControl`. For example, a validator that could 
automatically fire `sendActionsForControlEvents` when validation completes to 
its receivers would be pretty wicked awesome right? The catch is that I don't 
want ALL Behaviors to subclass `UIControl`. In Swift 2.0 we can make a Behavior 
protocol and then add extension methods to it to handle ownership (I think), but 
for now, we're going to duplicate things.

*/
public class BehaviorControl: UIControl {

    // MARK: - Lifetime Management
    
    /**
    The object that this Behavior is bound to. Uses Objective C Runtime magic to make the lifetime of this behavior match its owner's. When the owner is released, so is this.
    */
    @IBOutlet weak var owner: NSObject? {
        willSet {
            if let oldOwner = owner {
                releaseLifetimeFromObject(oldOwner)
            }
        }
        didSet {
            if let newOwner = owner {
                bindLifetimeToObject(newOwner)
            }
        }
    }
    
    private struct AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
    }
    
    private func bindLifetimeToObject(object: NSObject) {
        objc_setAssociatedObject(object,
            &AssociatedKeys.DescriptiveName,
            self,
            UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    }
    
    private func releaseLifetimeFromObject(object: NSObject) {
        objc_setAssociatedObject(object,
            &AssociatedKeys.DescriptiveName,
            nil,
            UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    }

}
