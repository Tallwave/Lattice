//
//  StringMask.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/29/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

// NSMatchingOptions.WithoutAnchoringBounds 1 << 4

import UIKit

private let resultIndex = 0
private let lengthIndex = 0

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
        let range = NSRange(location: 0, length: count(validChars))
        let formattedRange = NSRange(location: 0, length: formattedString.length)
        let newPattern = patternStep(pattern, onString: validChars, iteration: 1, resultFetcher: formattedString, range: range, placeholder: placeholder)
        formattedString.replaceOccurrencesOfString(newPattern,
            withString: pattern as String,
            options: NSStringCompareOptions.RegularExpressionSearch,
            range: formattedRange)
        return formattedString as String
    }

    func validCharactersFor(string: String) -> String {
        let pattern = NSMutableString(string: regex.pattern)
        var error: NSError?
        let firstGroupPattern = getStepPattern(pattern, iteration: 1)
        let validCharacters = NSMutableString()
        for var i = 2; firstGroupPattern != nil; i++ {
            let n: UInt = 0
            var adaptingResult = []
            var result: NSTextCheckingResult?

            // gonna break
            while result?.range.length != adaptingResult[lengthIndex].integerValue {
                // add a capturing group to the pattern
                adaptingResult = adaptsFirstGroupPattern
            }
        }
//        for (int i = 2; firstGroupPattern != nil; i++)
//        {
//            do
//            {
//                // Add a capturing group to the pattern
//                adaptingResult = [self adaptsFirstGroupPattern:firstGroupPattern subtracting:n];
//                if (adaptingResult[kLENGTH_INDEX] == 0) break;
//
//                firstGroupPattern = adaptingResult[kRESULT_INDEX];
//
//                // Try to match the pattern
//                NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:firstGroupPattern
//                    options:NSRegularExpressionCaseInsensitive
//                    error:&error];
//
//                result = [regex firstMatchInString:string options:NSMatchingWithoutAnchoringBounds range:NSMakeRange(0, string.length)];
//                if (! result) break;
//
//                NSString *matchedString = [string substringWithRange:result.range];
//
//                string = [string stringByReplacingCharactersInRange:result.range withString:@""];
//
//                [validCharacters appendString:matchedString];
//
//                n += result.range.length;
//            }
//                while (result.range.length != [adaptingResult[kLENGTH_INDEX] integerValue]);
//
//            firstGroupPattern = [self getStepPattern:&pattern iter:i];
//        }
//        
//        return validCharacters;
    }

    private func adaptsFirstGroupPattern(group: String, subtracting n: UInt) -> (String, Int) {
        var error: NSError?
        // Gets the expected maximum repetition for the current group
        let maxRepetEx = NSRegularExpression(pattern: "\\{((\\d+)?(?:,(\\d+)?)?)\\}",
            options: .AnchorsMatchLines,
            error: &error)!
        let groupRange = NSRange(location: 0, length: count(group))
        let numRep = maxRepetEx.firstMatchInString(group,
            options: .WithoutAnchoringBounds,
            range: groupRange)!

        // Tries to get the maximum
        var range = numRep.rangeAtIndex(3)
        if range.location == NSNotFound {
            range = numRep.rangeAtIndex(2)
        }
        var numberOfReps = (group as NSString).substringWithRange(range).toInt()!

        // Replaces the the content of braces with {1, numberOfRepetitions}
        if numberOfReps > 0 {
            let val = numberOfReps - Int(n)
            let format = NSString(format: "1,%lu", val)
            let newGroup = (group as NSString).stringByReplacingCharactersInRange(numRep.rangeAtIndex(1), withString: format as String)
        } else {
            numberOfReps = NSIntegerMax
        }
        return (group, numberOfReps)
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
