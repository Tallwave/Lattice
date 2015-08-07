//
//  EmailTextValidatorTests.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class EmailTextValidatorTests: XCTestCase {

    private var validator = EmailTextValidator()
    private var textfield = UITextField()
    private var textview = UITextView()
    
    override func setUp() {
        validator = EmailTextValidator()
        textfield = UITextField()
        textview = UITextView()
        validator.view = textfield
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddressPasses() {
        textfield.text = "test@example.com"
        XCTAssertTrue(validator.validate())
    }
    
    func testBadAddressFails() {
        textfield.text = "bad"
        XCTAssertFalse(validator.validate())
    }
}
