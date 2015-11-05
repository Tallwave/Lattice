//
//  TextFieldBehaviorContainer.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Treats a group of `TextFieldBehaviors` as a single delegate for a `UITextField`. When the textfield calls its delegate method, this loops through each behavior and sees if it has that particular method defined.
*/
class TextFieldBehaviorContainer: NSObject, UITextFieldDelegate {
    private var behaviors: [TextFieldBehavior] = []
    
    /**
    Adds the `behavior` to the group.
    
    - parameter behavior: The `Behavior` to add.
    */
    func addBehavior(behavior: TextFieldBehavior) {
        behaviors.append(behavior)
    }
    
    // MARK: - UITextFieldDelegate
    func textField(tf: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return allBehaviorsAre(true) { $0.textField?(tf,
            shouldChangeCharactersInRange: range,
            replacementString: string) }
    }

    func textFieldDidBeginEditing(tf: UITextField) {
        onAllBehaviors { $0.textFieldDidBeginEditing?(tf) }
    }
    
    func textFieldDidEndEditing(tf: UITextField) {
        onAllBehaviors { $0.textFieldDidEndEditing?(tf) }
    }
    
    func textFieldShouldBeginEditing(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldBeginEditing?(tf) }
    }

    func textFieldShouldClear(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldClear?(tf) }
    }
    
    func textFieldShouldEndEditing(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldEndEditing?(tf) }
    }
    
    func textFieldShouldReturn(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldReturn?(tf) }
    }

    private func onAllBehaviors(action: (UITextFieldDelegate) -> Void) {
        for behavior in behaviors as [UITextFieldDelegate] {
            action(behavior)
        }
    }

    private func allBehaviorsAre(expected: Bool, function: ((UITextFieldDelegate) -> Bool?)) -> Bool {
        for behavior in behaviors as [UITextFieldDelegate] {
            if let result = function(behavior) {
                if result != expected {
                    return result
                }
            }
        }
        return expected
    }
}
