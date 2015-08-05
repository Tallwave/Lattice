//
//  NumberValidatorTests.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class NumberValidatorTests: XCTestCase {

    private var validator = NumberValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = NumberValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testNumberPasses() {
        textfield.text = "123"
        XCTAssertTrue(validator.validate())
    }
    
    func testTextFails() {
        textfield.text = "av123c"
        XCTAssertFalse(validator.validate())
    }
    
    func testDecimalPasses() {
        textfield.text = "123.1"
        XCTAssertTrue(validator.validate())
    }
    
    func testDecimalInFrontPasses() {
        textfield.text = ".123"
        XCTAssertTrue(validator.validate())
    }
    
    func testMultipleDecimalsFails() {
        textfield.text = "123.1.1"
        XCTAssertFalse(validator.validate())
    }
    
    func testDisallowedDecimalsWithDecimalsFails() {
        validator.allowDecimal = false
        textfield.text = "123.1"
        XCTAssertFalse(validator.validate())
    }
    
    func testDisallowedDecimalsPassesWithoutDecimal() {
        validator.allowDecimal = false
        textfield.text = "123"
        XCTAssertTrue(validator.validate())
    }
    
    func testMinusPasses() {
        textfield.text = "-123"
        XCTAssertTrue(validator.validate())
    }
    
    func testMinusInBadPlaceFails() {
        textfield.text = "1-23"
        XCTAssertFalse(validator.validate())
    }
    
    func testMultipleMinusFails() {
        textfield.text = "--123"
        XCTAssertFalse(validator.validate())
    }
    
    func testDisallowedMinusWithMinusFails() {
        validator.allowNegative = false
        textfield.text = "-123"
        XCTAssertFalse(validator.validate())
    }
    
    func testDisallowedMinusWithoutMinusPasses() {
        validator.allowNegative = false
        textfield.text = "123"
        XCTAssertTrue(validator.validate())
    }
    
    func testBothNegativeAndMinusPasses() {
        textfield.text = "-123.1"
        XCTAssertTrue(validator.validate())
    }
    
    func testNegativeAndDecimalInFrontPasses() {
        textfield.text = "-.123"
        XCTAssertTrue(validator.validate())
    }
}
