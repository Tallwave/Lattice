//
//  Behavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

// Must extend from NSObject because subclasses require NSObjectProtocol.
public class Behavior: NSObject {

    // MARK: - Lifetime Management
    
    // Which object this Behavior is bound to. Uses Objective C Runtime magic to make the lifetime of this behavior match its owner's.
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
