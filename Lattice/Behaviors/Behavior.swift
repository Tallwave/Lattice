//
//  Behavior.swift
//  Lattice
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
A "Behavior" is a single piece of logic encapsulated into a class that can be applied to a view or other object, usually through Interface Builder.

Must extend from NSObject because subclasses require NSObjectProtocol. Swift has a lot of really cool stuff going on with it in the Protocol and Struct department, but sometimes when you interact with Cooca you gotta use a Class.

If an Object is dropped into Interface Builder without being connected to a View Controller (or other object), it will be released almost immediately making it a bit less useful. One way to solve that problem would be to create properties for it on the View Controller. But it seems a little unnecessary to create a property just to keep something alive in memory. So instead, we invoke a little  of the Objective C Runtime voodoo to bind their lifetimes to that of their owners.
*/
public class Behavior: NSObject {

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
                bindLifetimeObjectToObject(newOwner)
            }
        }
    }

    private struct AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
    }
    
    private func bindLifetimeObjectToObject(object: NSObject) {
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
