//
//  MinLengthValidatorTests.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class MinLengthValidatorTests: XCTestCase {

    private var validator = MinLengthValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = MinLengthValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMinLengthFail() {
        validator.minimumLength = 10
        textfield.text = "short"
        XCTAssertFalse(validator.validate())
    }
    
    func testMinLengthPass() {
        validator.minimumLength = 2
        textfield.text = "long enough"
        XCTAssertTrue(validator.validate())
    }
}
