//
//  RequiredTextValidatorTests.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class RequiredTextValidatorTests: XCTestCase {
    
    private var validator = RequiredTextValidator()
    private var textfield = UITextField()
    private var textview = UITextView()

    override func setUp() {
        validator = RequiredTextValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testValidateIsFalseForEmptyText() {
        textfield.text = ""
        XCTAssertFalse(validator.validate())
    }
    
    func testValidateIsFalseForEmptyTrimmedText() {
        textfield.text = "    "
        XCTAssertFalse(validator.validate())
    }
    
    func testValidateIsTrueForRealText() {
        textfield.text = "hi"
        XCTAssertTrue(validator.validate())
    }
    
    func testValidateIsTrueForTrimmedRealText() {
        textfield.text = "  hi  "
        XCTAssertTrue(validator.validate())
    }
    
    func testValidateIsTrueForNoView() {
        validator.view = nil
        XCTAssertTrue(validator.validate())
    }
    
    func testValidateIsTrueForEmptyTextWhenAcceptingEmptyText() {
        textfield.text = "   "
        validator.acceptBlankText = true
        XCTAssertTrue(validator.validate())
    }
    
    func testValidateIsTrueForTextView() {
        validator.view = textview
        textview.text = "hi"
        XCTAssertTrue(validator.validate())
    }
}
