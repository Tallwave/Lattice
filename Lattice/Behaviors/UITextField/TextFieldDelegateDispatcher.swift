//
//  TextFieldDelegateDispatcher.swift
//  Lattice
//
//  Created by Scott Williams on 8/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

typealias TextFieldLookup = [String: TextFieldBehaviorContainer]

class TextFieldDelegateDispatcher {
    private var lookup: TextFieldLookup = TextFieldLookup()
    
    private init() {
    }
    
    static let dispatcher = TextFieldDelegateDispatcher()
    
    func addBehavior(behavior: TextFieldBehavior, toTextField textField: UITextField) {
        let symbol = symbolForTextField(textField)
        if let container = lookup[symbol] {
            container.addBehavior(behavior)
        } else {
            let container = TextFieldBehaviorContainer()
            textField.delegate = container
            container.addBehavior(behavior)
            lookup[symbol] = container
        }
    }
    
    private func symbolForTextField(textField: UITextField) -> String {
        return String(format: "%p", arguments: [textField])
    }
}
