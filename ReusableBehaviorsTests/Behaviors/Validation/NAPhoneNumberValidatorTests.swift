//
//  NAPhoneNumberValidatorTests.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class NAPhoneNumberValidatorTests: XCTestCase {

    private var validator = NorthAmericanPhoneNumberValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = NorthAmericanPhoneNumberValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testGoodNumberPasses() {
        textfield.text = "1 (202) 456-1414"
        XCTAssertTrue(validator.validate())
    }
    
    func testBadNumberFails() {
        textfield.text = "456144"
        XCTAssertFalse(validator.validate())
    }
}
