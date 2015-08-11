//
//  ImageReceiver.swift
//  Lattice
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
    Receives a `UIImage` from an `ImagePickerBehavior` and does something intelligent with it (see subclasses).

    Swift does not have abstract classes, and Interface Builder does not play well with Protocols, so this is essentially a placeholder.
*/
public class ImageReceiver: Behavior {
    /**
    A placeholder method designed to be implemented on subclasses. Does nothing.
    */
    public func handleImage(image: UIImage?) {
    }
}

/**
    Receives a `UIImage` from an `ImagePickerBehavior` and then displays it in a `UIImageView`.
*/
public class DefaultImageReceiver: ImageReceiver {
    /**
    Where the image is displayed.
    */
    @IBOutlet public weak var imageView: UIImageView!

    /**
    Receives a `UIImage` from an `ImagePickerBehavior` and displays it in the `imageView`.
    */
    public override func handleImage(image: UIImage?) {
        imageView.image = image
    }
}