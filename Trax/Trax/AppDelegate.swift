//
//  AppDelegate.swift
//  Trax
//
//  Created by SkyeKoo on 15/3/6.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

// To set up the radio station
struct GPXURL {
    static let Notification = "GPXURL Radio Station"
    static let Key = "GPXURL URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?   // Needs this pointer

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        let center = NSNotificationCenter.defaultCenter()
        let notification = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.Key:url])
        center.postNotification(notification)
        return true
    }

}

