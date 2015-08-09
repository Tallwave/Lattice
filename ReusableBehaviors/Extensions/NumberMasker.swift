//
//  StringMask.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/29/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

// NSMatchingOptions.WithoutAnchoringBounds 1 << 4 (16)
// NSRegularExpressionOptions.AnchorsMatchLines (16)

import UIKit

struct NumberMasker {
    func mask(string: String, withPattern pattern: String) -> String {
        var stringIndex = 0
        var patternIndex = 0
        let stringCount = count(string)
        let patternCount = count(pattern)
        var formattedString = ""
        while stringIndex < stringCount && patternIndex < patternCount {
            let startCharStringIndex = advance(string.startIndex, stringIndex)
            let endCharStringIndex = advance(string.startIndex, stringIndex + 1)
            let currentStringChar = string.substringWithRange(Range<String.Index>(start: startCharStringIndex, end: endCharStringIndex))

            let startCharPatternIndex = advance(pattern.startIndex, patternIndex)
            let endCharPatternIndex = advance(pattern.startIndex, patternIndex + 1)
            let currentPatternChar = pattern.substringWithRange(Range<String.Index>(start: startCharPatternIndex, end: endCharPatternIndex))

            switch currentPatternChar {
            case "#":
                if currentStringChar.toInt() != nil {
                    formattedString += currentStringChar
                    patternIndex += 1
                }
                stringIndex += 1
            default:
                formattedString += currentPatternChar
                if currentStringChar == currentPatternChar {
                    stringIndex += 1
                }
                patternIndex += 1
            }
        }
        return formattedString
    }
}