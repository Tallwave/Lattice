//
//  StringMask.swift
//  Lattice
//
//  Created by Scott Williams on 7/29/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

// NSMatchingOptions.WithoutAnchoringBounds 1 << 4 (16)
// NSRegularExpressionOptions.AnchorsMatchLines (16)

import UIKit

/**
Masks a numeric string according to a pattern defined.

The pattern should resemble a string of #'s with the punctuation and spacing at 
appropriate positions. For example a phone number's pattern would look like 
`(###) ###-####`.

The masker will skip over any characters that are not numbers. If a string is 
shorter than the pattern, it will be masked to the pattern for as much as it 
can. For example, `12345` masked against the phone number mask will be 
`(123) 45`.
*/
struct NumberMasker {
    func mask(string: String, withPattern pattern: String) -> String {
        var stringIndex = 0
        var patternIndex = 0
        let stringCount = count(string)
        let patternCount = count(pattern)
        var formattedString = ""

        while stringIndex < stringCount && patternIndex < patternCount {
            let currentStringChar = character(inString: string, atIndex: stringIndex)
            let currentPatternChar = character(inString: pattern, atIndex: patternIndex)

            switch currentPatternChar {
            case "#":
                if currentStringChar.isDigit() {
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

    private func character(inString string: String, atIndex index: Int) -> String {
        let startStringIndex = advance(string.startIndex, index)
        let endStringIndex = advance(string.startIndex, index + 1)
        return string.substringWithRange(Range<String.Index>(start: startStringIndex, end: endStringIndex))
    }
}