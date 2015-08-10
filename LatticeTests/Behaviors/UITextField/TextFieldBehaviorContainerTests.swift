//
//  TextFieldBehaviorContainerTests.swift
//  Lattice
//
//  Created by Scott Williams on 7/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest
import Lattice

class TextFieldBehaviorContainerTests: XCTestCase {
    let tf = UITextField()
    let container = TextFieldBehaviorContainer()

    func testHandlesMultipleTextFields() {
        let behavior1 = TextFieldDoneBehavior()
        let behavior2 = TextFieldMaxLengthBehavior()
        container.behaviors = [behavior1, behavior2]
        let result = container.textFieldShouldReturn(tf)
        XCTAssertFalse(result, "did not resign")
    }
}
