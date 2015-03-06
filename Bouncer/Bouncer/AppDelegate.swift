//
//  AppDelegate.swift
//  Bouncer
//
//  Created by SkyeKoo on 15/3/6.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    struct Motion {
        static let Manager = CMMotionManager()
    }

}

