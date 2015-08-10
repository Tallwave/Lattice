//
//  StandardImagePickerBehavior.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

/**
Most times you want to pick an image, then display the image in a `UIImageView`.
This wraps that up so that you don't have to pull in an additional `Behavior` 
for the `ImageReceiver`.
*/
public class StandardImagePickerBehavior: ImagePickerBehavior {
    @IBOutlet weak var imageView: UIImageView!
    
    public override func sendImageToReceiver(image: UIImage?) {
        imageView.image = image
    }
}
