//
//  ScrollToFitBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/28/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class ScrollToFitBehavior: Behavior {
    private var originalConstraintValue: CGFloat?

    @IBOutlet public weak var constraintToModify: NSLayoutConstraint?
    @IBOutlet public var textControls: [UIView]!

    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func keyboardWillShow(notification: NSNotification) {
        if let textField = viewToCheckForOverlap() {
            let textFieldBottomY = textField.frame.maxY
            if let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            keyboardAnimationDurationValue = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber {
                let keyboardTop = keyboardFrameValue.CGRectValue().minY
                let diff = keyboardTop - textFieldBottomY
                let duration = keyboardAnimationDurationValue.doubleValue
                if diff < 0 {
                    adjustDistance(diff, overDuration: duration)
                }
            }
        }
    }

    func keyboardWillHide(notification: NSNotification) {
        if viewToCheckForOverlap() != nil {
            if let keyboardAnimationDurationValue = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber {
                resetDistance(overDuration: keyboardAnimationDurationValue.doubleValue)
            }
        }
    }

    private func viewToCheckForOverlap() -> UIView? {
        let firstResponderArray = textControls.filter { $0.isFirstResponder() }
        return firstResponderArray.first
    }

    private func adjustDistance(distance: CGFloat, overDuration duration: NSTimeInterval) {
        if originalConstraintValue == nil {
            originalConstraintValue = constraintToModify?.constant
        }

        UIView.animateWithDuration(duration) {
            self.constraintToModify?.constant += distance
        }
    }

    private func resetDistance(overDuration duration: NSTimeInterval) {
        if let originalConstraintValue = self.originalConstraintValue {
            UIView.animateWithDuration(duration) {
                self.constraintToModify?.constant = originalConstraintValue
            }
        }
    }
}
