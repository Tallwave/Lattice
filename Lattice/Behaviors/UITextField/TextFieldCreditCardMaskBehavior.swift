//
//  TextFieldCreditCardMaskBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Popular credit cards. Smaller cards like Diners Club aren't big enough to 
warrant including at this time.
*/
enum CreditCard {
    case Visa,
    MasterCard,
    Discover,
    Amex
    
    /**
    This is not the most accurate since credit cards can vary on more than just 
    the first number.
    */
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

/**
    A NumberMasker to be used with a Credit Card input.
*/
public class TextFieldCreditCardMaskBehavior: TextFieldNumericMaskBehavior {
    public override func mask(text: String) -> String {
        if count(text) == 0 {
            return super.mask(text)
        }
        let card = CreditCard(cardNumber: text)
        return masker.mask(text, withPattern: card.pattern)
    }
}
