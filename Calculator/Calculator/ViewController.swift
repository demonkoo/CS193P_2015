//
//  ViewController.swift
//  Calculator
//
//  Created by SkyeKoo on 15/3/5.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    // Needs to have a initial value
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        // Optional state: 1. not set; 2. set to some type
        // Use ! to unwrapped, but if the optional is nil, crash!
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            // display.text is an optional! Need to be unwrapped
            display.text = display.text! + digit
            //println("digit = \(digit)")
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
}

