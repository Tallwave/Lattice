//
//  TextFieldBehaviorContainer.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

class TextFieldBehaviorContainer: NSObject, UITextFieldDelegate {
    // Allow bubbling up of delegate methods to the owner.
    weak var delegate: UITextFieldDelegate?
    
    private var behaviors: [TextFieldBehavior] = []
    
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
        delegate?.textFieldDidBeginEditing?(tf)
    }
    
    func textFieldDidEndEditing(tf: UITextField) {
        onAllBehaviors { $0.textFieldDidEndEditing?(tf) }
        delegate?.textFieldDidEndEditing?(tf)
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
        if let delegate = delegate, delegateResult = function(delegate) {
            return expected == delegateResult
        }
        return expected
    }
}
