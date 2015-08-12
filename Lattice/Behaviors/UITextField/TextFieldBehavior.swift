//
//  TextFieldBehavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
An empty class to allow for `TextFieldBehaviorContainer`'s `behaviors` property to contain both `Behavior` and `UITextFieldDelegate`.
*/
public class TextFieldBehavior: Behavior, UITextFieldDelegate {
    @IBOutlet weak var textfield: UITextField? {
        didSet {
            if let tf = self.textfield {
                TextFieldDelegateDispatcher.dispatcher.addBehavior(self, toTextField: tf)
            }
        }
    }
    
    deinit {
        println("POOF")
    }
}
