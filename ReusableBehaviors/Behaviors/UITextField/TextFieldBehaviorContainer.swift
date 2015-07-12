//
//  TextFieldBehaviorContainer.swift
//  ExampleApp
//
//  Created by Scott Williams on 7/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class TextFieldBehaviorContainer: TextFieldBehavior {
    // Allow bubbling up of delegate methods to the owner.
    @IBOutlet weak var delegate: UITextFieldDelegate?
    
    @IBOutlet weak var textfield: UITextField? {
        didSet {
            textfield?.delegate = self
        }
    }
    
    @IBOutlet public var behaviors: [TextFieldBehavior]!
    
    // MARK: - UITextFieldDelegate
    public func textField(tf: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return allBehaviorsAre(true) { $0.textField?(tf,
            shouldChangeCharactersInRange: range,
            replacementString: string) }
    }

    public func textFieldDidBeginEditing(tf: UITextField) {
        onAllBehaviors { $0.textFieldDidBeginEditing?(tf) }
        delegate?.textFieldDidBeginEditing?(tf)
    }
    
    public func textFieldDidEndEditing(tf: UITextField) {
        onAllBehaviors { $0.textFieldDidEndEditing?(tf) }
        delegate?.textFieldDidEndEditing?(tf)
    }
    
    public func textFieldShouldBeginEditing(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldBeginEditing?(tf) }
    }

    public func textFieldShouldClear(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldClear?(tf) }
    }
    
    public func textFieldShouldEndEditing(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldEndEditing?(tf) }
    }
    
    public func textFieldShouldReturn(tf: UITextField) -> Bool {
        return allBehaviorsAre(true) { $0.textFieldShouldReturn?(tf) }
    }

    private func onAllBehaviors(action: (UITextFieldDelegate) -> Void) {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                action(behavior)
            }
        }
    }

    private func allBehaviorsAre(expected: Bool, function: ((UITextFieldDelegate) -> Bool?)) -> Bool {
        if let allBehaviors = behaviors {
            for behavior in allBehaviors as [UITextFieldDelegate] {
                if let result = function(behavior) {
                    if result != expected {
                        return result
                    }
                }
            }
        }
        if let delegate = delegate, delegateResult = function(delegate) {
            return expected == delegateResult
        }
        return expected
    }
}
