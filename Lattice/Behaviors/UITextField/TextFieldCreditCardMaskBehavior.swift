//
//  TextFieldCreditCardMaskBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

enum CreditCard {
    case Visa,
    MasterCard,
    Discover,
    Amex
    
    init(cardNumber: String) {
        let startIndex = cardNumber.startIndex
        let endIndex = advance(cardNumber.startIndex, 1)
        let firstChar = cardNumber.substringWithRange(Range<String.Index>(start: startIndex, end: endIndex))
        switch firstChar {
            case "3": self = .Amex
            case "4": self = .Visa
            case "5": self = .MasterCard
            case "6": self = .Discover
            default: self = .Visa
        }
    }
    
    var pattern: String {
        switch self {
        case .Amex:
            return "#### ###### #####"
        default:
            return "#### #### #### ####"
        }
    }
}

public class TextFieldCreditCardMaskBehavior: TextFieldNumericMaskBehavior {
    public override func mask(text: String) -> String {
        if count(text) == 0 {
            return super.mask(text)
        }
        let card = CreditCard(cardNumber: text)
        return masker.mask(text, withPattern: card.pattern)
    }
}
