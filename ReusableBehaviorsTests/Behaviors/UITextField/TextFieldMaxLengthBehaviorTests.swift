//
//  TextFieldMaxLengthBehaviorTests.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest
import ReusableBehaviors

class TextFieldMaxLengthBehaviorTests: XCTestCase {
    let behavior = TextFieldMaxLengthBehavior()
    let tf = UITextField()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMaxLength() {
        behavior.maxLength = 5
        let range = NSMakeRange(0, 1)
        tf.text = "hi"
        let result = behavior.textField(tf, shouldChangeCharactersInRange: range, replacementString: "This string is too long")
        XCTAssertFalse(result, "Behavior allowed an invalidly long string to be inserted")
    }
}
