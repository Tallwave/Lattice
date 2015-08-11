//
//  LastPhotoRetriever.swift
//  Lattice
//
//  Created by Scott Williams on 8/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import Photos

/**
    Alias for sending an image back from an asynchronous process.
*/
typealias ImageCallback = (UIImage? -> Void)

/**
    Fetches the last photo taken in the user's library.

    [Read more about the Photos Framework](http://blog.swilliams.me/words/2015/08/09/finding-the-last-photo-taken/).
*/
struct LastPhotoRetriever {
    /**
        Fetches the last photo taken in the user's library.
    */
    func fetchLastPhoto(resizeTo size: CGSize?, imageCallback: ImageCallback) {
        if let fetchResult = searchPhotosLibraryForImages() {
            if let asset = fetchResult.firstObject as? PHAsset {
                convertAsset(asset, toImageWithSize: size, imageCallback: imageCallback)
            } else {
                imageCallback(nil)
            }
        } else {
            imageCallback(nil)
        }
    }

    private var fetchOptions: PHFetchOptions {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        options.fetchLimit = 1 // Available in iOS 9
        return options
    }

    private func searchPhotosLibraryForImages() -> PHFetchResult? {
        return PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions)
    }

    private func convertAsset(asset: PHAsset, toImageWithSize size: CGSize?, imageCallback: ImageCallback) {
        let manager = PHImageManager.defaultManager()
        let targetSize = size ?? CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
        manager.requestImageForAsset(asset,
            targetSize: targetSize,
            contentMode: .AspectFit,
            options: nil,
            resultHandler: { image, info in
                imageCallback(image)
        })
    }
}
