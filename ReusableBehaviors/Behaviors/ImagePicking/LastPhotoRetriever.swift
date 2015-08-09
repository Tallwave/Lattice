//
//  LastPhotoRetriever.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 8/9/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import Photos

struct LastPhotoRetriever {
    func getLastPhoto() -> UIImage? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        fetchOptions.fetchLimit = 1
        if let fetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions) {
            return fetchResult.firstObject as? UIImage
        }
        return nil
    }
}
