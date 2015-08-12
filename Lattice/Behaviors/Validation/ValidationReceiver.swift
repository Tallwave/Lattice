//
//  ValidationReceiver.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Interface Builder doesn't really like protocols, but ¯\_(ツ)_/¯. Defines the methods for handling validation results.
*/
public protocol ValidationReceiver {
    func validationUpdated(sender: ValidatorContainer)
    var successAction: PostValidationAction? { get set }
    var failureAction: PostValidationAction? { get set }
}
