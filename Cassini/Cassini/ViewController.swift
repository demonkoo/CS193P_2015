//
//  ViewController.swift
//  Cassini
//
//  Created by SkyeKoo on 15/3/1.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Stanford":
                    ivc.imageURL = DemoURL.Stanford
                    ivc.title = "Stanford"
                default: break
                }
            }
        }
    }

}

