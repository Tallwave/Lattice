//
//  ScrollToFitBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 7/28/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    When the onscreen keyboard overlaps a control, slide the screen up to bring the control back into frame.
    
    This works by modifying the top most constraint (defined here).
*/
public class ScrollToFitBehavior: Behavior {
    private var originalConstraintValue: CGFloat?

    @IBOutlet public weak var constraintToModify: NSLayoutConstraint?
    @IBOutlet public weak var containingView: UIView?
    /**
        `UIView` is the first common ancestor for both `UITextField` and `UITextView`. When the keyboard is shown (via `UIKeyboardWillShowNotification`) the class will scan this array to see if any of its views are `firstResponder`, than act accordingly. 
    
        Considering a `willSet` accessor to screen for just text views, but there may be other cases where allowing a generic `UIView` in is required.
    */
    @IBOutlet public var textControls: [UIView]!

    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
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

        constraintToModify?.constant += distance
        containingView?.setNeedsUpdateConstraints()
        UIView.animateWithDuration(duration) {
            self.containingView?.layoutIfNeeded()
        }
    }

    private func resetDistance(overDuration duration: NSTimeInterval) {
        if let originalConstraintValue = self.originalConstraintValue,
        containingView = self.containingView {
            constraintToModify?.constant = originalConstraintValue
            containingView.setNeedsUpdateConstraints()
            UIView.animateWithDuration(duration) {
                containingView.layoutIfNeeded()
            }
        }
    }
}
