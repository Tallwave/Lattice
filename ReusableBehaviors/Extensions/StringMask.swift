//
//  StringMask.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/29/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

struct StringMask {
    var regex: NSRegularExpression
    var placeholder: String = ""

    init(regex: NSRegularExpression) {
        self.regex = regex
    }

    init(regex: NSRegularExpression, placeholder: String) {
        self.regex = regex
        self.placeholder = placeholder
    }

    init?(pattern: String) {
        var error: NSError?
        if let regex = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error) {
            self.regex = regex
        }
        return nil
    }

    init?(pattern: String, placeholder: String) {
        var error: NSError?
        if let regex = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error) {
            self.placeholder = placeholder
            self.regex = regex
        }
        return nil
    }

    static func mask(string: String, withRegex regex: NSRegularExpression, placeholder: String = "") -> String {
        let mask = StringMask(regex: regex, placeholder: placeholder)
        return mask.format(string)
    }

    static func mask(string: String, withPattern pattern: String, placeholder: String = "") -> String? {
        var error: NSError?
        if let regex = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error) {
            if error == nil {
                return StringMask.mask(string, withRegex: regex, placeholder: placeholder)
            }
        }
        return nil
    }

    func format(string: String) -> String {
        let validChars = validCharactersFor(string)
        let pattern = NSMutableString(string: regex.pattern)
        let formattedString = NSMutableString()
        return formattedString as String
    }

    func validCharactersFor(string: String) -> String {
        return ""
    }

    private func patternStep(pattern: NSMutableString, onString string: String, iteration: Int64, resultFetcher mutableResult: NSMutableString, range: NSRange, placeholder: String) -> String {
        if let firstGroupPattern = getStepPattern(pattern, iteration: iteration) {
            var error: NSError?
            let regex = NSRegularExpression(pattern: firstGroupPattern, options: .AnchorsMatchLines, error: &error)!
            let checkResult = regex.firstMatchInString(string, options: .WithoutAnchoringBounds, range: range)
            if checkResult == nil || checkResult!.range.location == NSNotFound {
                
            }

        }
        return ""
    }

    private func getStepPattern(pattern: NSMutableString, iteration: Int64) -> String? {
        var error: NSError?
        let regex = NSRegularExpression(pattern: "(?<!\\\\)\\(([^)(]*)(?<!\\\\)\\)", options: .CaseInsensitive, error: &error)!
        let range = NSRange(location: 0, length: pattern.length)
        if let check = regex.firstMatchInString(pattern as String, options: .WithoutAnchoringBounds, range: range) {
            if check.range.location == NSNotFound { return nil }
            let result = pattern.substringWithRange(check.rangeAtIndex(1))
            pattern.replaceCharactersInRange(check.range, withString: "\(iteration)")
        }
        return nil
    }
}
