//
//  LastPhotoRetriever.swift
//  Lattice
//
//  Created by Scott Williams on 8/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import Photos

typealias ImageCallback = (UIImage? -> Void)

struct LastPhotoRetriever {
    func fetchLastPhoto(resizeTo size: CGSize?, imageCallback: ImageCallback) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        //        fetchOptions.fetchLimit = 1 // Available in iOS 9
        
        if let fetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions) {
            if let asset = fetchResult.firstObject as? PHAsset {
                let manager = PHImageManager.defaultManager()
                let targetSize = size ?? CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
                manager.requestImageForAsset(asset,
                    targetSize: targetSize,
                    contentMode: .AspectFit,
                    options: nil,
                    resultHandler: { image, info in
                        imageCallback(image)
                })
            } else {
                imageCallback(nil)
            }
        } else {
            imageCallback(nil)
        }
    }
}
