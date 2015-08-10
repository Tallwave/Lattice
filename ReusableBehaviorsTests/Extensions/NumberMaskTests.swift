//
//  StringMaskTests.swift
//  Lattice
//
//  Created by Scott Williams on 8/8/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest

class NumberMaskTests: XCTestCase {

    private var masker = NumberMasker()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMaskWithSimplePattern() {
        let result = masker.mask("12345", withPattern: "###-##")
        XCTAssertEqual("123-45", result, "Expected 123-45, got \(result)")
    }

    func testMaskWithShortString() {
        let result = masker.mask("123", withPattern: "###-##")
        XCTAssertEqual("123", result)
    }

    func testMaskWithLongString() {
        let result = masker.mask("12345678", withPattern: "###-##")
        XCTAssertEqual("123-45", result)
    }

    func testMaskWithNonNumericString() {
        let result = masker.mask("12a45", withPattern: "###-##")
        XCTAssertEqual("124-5", result, "")
    }

    func testPhoneNumber() {
        let result = masker.mask("4805551234", withPattern: "(###) ###-####")
        XCTAssertEqual("(480) 555-1234", result)
    }

    func testVisaNumber() {
        let result = masker.mask("4111111111111111", withPattern: "#### #### #### ####")
        XCTAssertEqual("4111 1111 1111 1111", result)
    }

    func testWhereStringMatchesPattern() {
        let result = masker.mask("123-45", withPattern: "###-##")
        XCTAssertEqual("123-45", result)
    }

    func testPrefixedSpace() {
        let result = masker.mask(" 12345 ", withPattern: "###-##")
        XCTAssertEqual(result, "123-45")
    }

    func testStringCloseToPattern() {
        let result = masker.mask("480 555 1234", withPattern: "(###) ###-####")
        XCTAssertEqual("(480) 555-1234", result)
    }

    func testVisaClose() {
        let result = masker.mask("4111 1111 111 1111", withPattern: "#### #### #### ####")
        XCTAssertEqual("4111 1111 1111 111", result)
    }
}
