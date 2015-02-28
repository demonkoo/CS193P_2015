//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by SkyeKoo on 15/2/28.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    // var diagnosticHistory = [Int]() // Bug! Everytime create a new instance!
    // Use userDefault to fix the bug
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
