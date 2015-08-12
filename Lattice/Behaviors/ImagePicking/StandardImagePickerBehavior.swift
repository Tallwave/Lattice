//
//  StandardImagePickerBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Most times you want to pick an image, then display the image in a `UIImageView`. This wraps that up so that you don't have to pull in an additional `Behavior` for the `ImageReceiver`.

## Usage
 1. Drag an Object onto the scene in Interface Builder
 2. Set its class to `StandardImagePickerBehavior`
 3. Connect the `owner`, `controller`, and `imageView` outlets
 4. Connect the `presentPickerOptions` action (usually to a `TouchUpInside` event)
*/
public class StandardImagePickerBehavior: ImagePickerBehavior {
    /**
    The `UIImageView` that will display the image once it has been loaded.
    */
    @IBOutlet weak var imageView: UIImageView!
    
    public override func sendImageToReceiver(image: UIImage?) {
        imageView.image = image
    }
}
