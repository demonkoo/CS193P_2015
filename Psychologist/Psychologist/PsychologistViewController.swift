//
//  PsychologistViewController.swift
//  Psychologist
//
//  Created by SkyeKoo on 15/2/28.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController  // UINavigationController is UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }
    

}

