//
//  PhoneNumberValidator.swift
//  Lattice
//
//  Created by Scott Williams on 8/5/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Checks if the text is a valid phone number. Pattern is based on this StackOverflow answer: http://stackoverflow.com/a/123666/736
*/
class NorthAmericanPhoneNumberValidator: RegularExpressionValidator {

    private let _pattern = "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})$"

    override var pattern: String {
        get { return _pattern }
        set {}
    }
}
