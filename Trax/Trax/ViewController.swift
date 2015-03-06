//
//  ViewController.swift
//  Trax
//
//  Created by SkyeKoo on 15/3/6.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate
        
        center.addObserverForName(GPXURL.Notification, object: appDelegate, queue: queue) { notification in
            if let url = notification?.userInfo?[GPXURL.Key] as? NSURL {
                self.textView.text = "Received \(url)"
            }
        }
    }

}

