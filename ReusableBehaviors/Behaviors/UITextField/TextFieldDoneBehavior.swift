//
//  TextFieldDoneBehavior.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class TextFieldDoneBehavior: TextFieldBehavior {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
