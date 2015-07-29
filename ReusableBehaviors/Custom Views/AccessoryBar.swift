//
//  AccessoryBar.swift
//  ReusableBehaviors
//
//  Created by Scott Williams on 7/24/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

private let standardToolbarHeight: CGFloat = 44

class AccessoryBar: UIToolbar {
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: Util.screenWidth, height: standardToolbarHeight)
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
