//
//  TextFieldDoneBehavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class TextFieldDoneBehavior: TextFieldBehavior {
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
