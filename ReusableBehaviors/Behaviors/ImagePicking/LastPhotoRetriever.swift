//
//  LastPhotoRetriever.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import Photos

typealias LastPhotoQuery = (UIImage? -> Void)

struct LastPhotoRetriever {
    func queryLastPhoto(toFitInImageView imageView: UIImageView, queryCallback: LastPhotoQuery) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        fetchOptions.fetchLimit = 1
        if let fetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions) {
            if let asset = fetchResult.firstObject as? PHAsset {
                let manager = PHImageManager.defaultManager()
                let size = CGSize(width: asset.pixelWidth, height: asset.pixelHeight) // imageView.frame.size
                manager.requestImageForAsset(asset, targetSize: size, contentMode: .AspectFit, options: nil, resultHandler: { image, info in
                    queryCallback(image)
                })
            }
        }
    }
}
