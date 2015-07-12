//
//  TextFieldDoneBehaviorTest.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest
import ReusableBehaviors

class TextFieldDoneBehaviorTest: XCTestCase {
    let behavior = TextFieldDoneBehavior()
    let tf = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 44))

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBehaviorResignsFirstResponder() {
        tf.becomeFirstResponder()
//        XCTAssertTrue(tf.isFirstResponder(), "Expect becomeFirstResponder to be true")
        let result = behavior.textFieldShouldReturn(tf)
        XCTAssertFalse(result, "Textfield did not resign")
        XCTAssertFalse(tf.isFirstResponder(), "Textfield is still firstresponder")
    }

}
