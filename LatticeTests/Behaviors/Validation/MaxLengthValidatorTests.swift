//
//  MinLengthValidatorTests.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class MaxLengthValidatorTests: XCTestCase {
    
    private var validator = MaxLengthValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = MaxLengthValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMaxLengthFail() {
        validator.maximumLength = 10
        textfield.text = "passes"
        XCTAssertTrue(validator.validate())
    }
    
    func testMaxLengthPass() {
        validator.maximumLength = 2
        textfield.text = "fails"
        XCTAssertFalse(validator.validate())
    }
}
