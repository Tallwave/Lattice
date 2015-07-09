//
//  TextFieldBehaviorContainer.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class TextFieldBehaviorContainer: TextFieldBehavior {
    // Allow bubbling up of delegate methods to the owner.
    @IBOutlet weak var delegate: UITextFieldDelegate?
    
    @IBOutlet weak var textfield: UITextField? {
        didSet {
            textfield?.delegate = self
        }
    }
    
    @IBOutlet var behaviors: [TextFieldBehavior]!
    
    // MARK: - UITextFieldDelegate
    func textField(tf: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = behavior.textField?(tf,
                    shouldChangeCharactersInRange: range,
                    replacementString: string) {
                        if !result {
                            return result
                        }
                }
            }
        }
        if let delegateResult = delegate?.textField?(tf, shouldChangeCharactersInRange: range, replacementString: string) {
            return delegateResult
        }
        return true
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
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = behavior.textFieldShouldBeginEditing?(tf) {
                    if !result { return result }
                }
            }
        }
        if let delegateResult = delegate?.textFieldShouldBeginEditing?(tf) {
            return delegateResult
        }
        return true
    }
    
    func textFieldShouldClear(tf: UITextField) -> Bool {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = behavior.textFieldShouldClear?(tf) {
                    if !result { return result }
                }
            }
        }
        if let delegateResult = delegate?.textFieldShouldClear?(tf) {
            return delegateResult
        }
        return true
    }
    
    func textFieldShouldEndEditing(tf: UITextField) -> Bool {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = behavior.textFieldShouldEndEditing?(tf) {
                    if !result { return result }
                }
            }
        }
        if let delegateResult = delegate?.textFieldShouldEndEditing?(tf) {
            return delegateResult
        }
        return true
    }
    
    func textFieldShouldReturn(tf: UITextField) -> Bool {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = behavior.textFieldShouldReturn?(tf) {
                    if !result { return result }
                }
            }
        }
        if let delegateResult = delegate?.textFieldShouldReturn?(tf) {
            return delegateResult
        }
        return true
    }
    
    private func onAllBehaviors(action: (UITextFieldDelegate) -> Void) {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                action(behavior)
            }
        }
    }
}
