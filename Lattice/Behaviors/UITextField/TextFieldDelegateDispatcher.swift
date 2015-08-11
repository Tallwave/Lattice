//
//  TextFieldDelegateDispatcher.swift
//  Lattice
//
//  Created by Scott Williams on 8/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

typealias TextFieldLookup = [UITextField: TextFieldBehaviorContainer]

public class TextFieldDelegateDispatcher {
    private var lookup: TextFieldLookup = TextFieldLookup()
    
    private init() {
    }
    
    public static let dispatcher = TextFieldDelegateDispatcher()
    
    public func count() {
        println("lookup count: \(lookup.count)")
    }
    
    func addBehavior(behavior: TextFieldBehavior, toTextField textField: UITextField) {
        let symbol = symbolForTextField(textField)
        if let container = lookup[textField] {
            container.addBehavior(behavior)
        } else {
            let container = TextFieldBehaviorContainer()
            textField.delegate = container
            container.addBehavior(behavior)
            lookup[textField] = container
        }
    }
    
    func removeTextField(textField: UITextField) {
        let symbol = symbolForTextField(textField)
        lookup.removeValueForKey(textField)
    }
    
    private func symbolForTextField(textField: UITextField) -> String {
        return String(format: "%p", arguments: [textField])
    }
}
