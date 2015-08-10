//
//  ImageReceiver.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/10/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

public class ImageReceiver: Behavior {
    public func handleImage(image: UIImage?) {
    }
}

public class DefaultImageReceiver: ImageReceiver {
    @IBOutlet public weak var imageView: UIImageView!
    
    public override func handleImage(image: UIImage?) {
        imageView.image = image
    }
}