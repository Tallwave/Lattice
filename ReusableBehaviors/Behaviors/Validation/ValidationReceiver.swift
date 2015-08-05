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
    var successAction: PostValidationAction? { get set }
    var failureAction: PostValidationAction? { get set }
}
