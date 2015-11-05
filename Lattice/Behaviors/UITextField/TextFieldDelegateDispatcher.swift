//
//  TextFieldDelegateDispatcher.swift
//  Lattice
//
//  Created by Scott Williams on 8/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Alias for a dictionary used by the dispatcher.
*/
typealias TextFieldLookup = [String: TextFieldBehaviorContainer]

/**
    Many times you want more than one Behavior operating on a textfield. A `UITextField` can only have 1 delegate though, so something has to work around that. When a `TextFieldBehavior` is assigned to a `UITextField`, it tells `TextFieldDelegateDispatcher`, which then groups it together with any other `TextFieldBehaviors` on the same field. They are collected in a `TextFieldBehaviorContainer` which becomes the textfield's delegate. `TextFieldBehaviorContainer` then forwards all delegate messages to various behaviors.

    ## Usage
    Happens automatically when you use `TextFieldBehaviors`.

    Uses `dispatcher` as a Singleton.
*/
public class TextFieldDelegateDispatcher {
    private var lookup: TextFieldLookup = TextFieldLookup()
    
    private init() {
    }
    
    /**
    Singleton instance of `TextFieldDelegateDispatcher`
    */
    public static let dispatcher = TextFieldDelegateDispatcher()
    
    /**
    Groups all the `behaviors` associated with `textField` together.
    
    - parameter behavior: The `Behavior` to add to the `textField`.
    - parameter textField: The `UITextField` that will use the `behavior`.
    
    NOTE: There may be a memory leak associated with this. Behaviors are added to an array in  `TextFieldBehaviorContainer`. When adding an object to an array, the array retains the object. So even though the VC containing the Behavior might be released, the behavior will still exist in the container.
    */
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
    
    /**
    Removes the `textField` from the container.
    
    - parameter textField: The `UITextField` to remove.
    */
    func removeTextField(textField: UITextField) {
        let symbol = symbolForTextField(textField)
        lookup.removeValueForKey(symbol)
    }
    
    private func symbolForTextField(textField: UITextField) -> String {
        return String(format: "%p", arguments: [textField])
    }
}
