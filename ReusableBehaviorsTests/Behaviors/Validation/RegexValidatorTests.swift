//
//  RegexValidatorTests.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class RegexValidatorTests: XCTestCase {

    private var validator = RegularExpressionValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = RegularExpressionValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPatternPasses() {
        validator.pattern = "[A-Z]+"
        textfield.text = "PASSES"
        XCTAssertTrue(validator.validate())
    }
    
    func testPatternFails() {
        validator.pattern = "[A-Z]+"
        textfield.text = "fails"
        XCTAssertFalse(validator.validate())
    }
}
