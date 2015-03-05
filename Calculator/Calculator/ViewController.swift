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
    // Use the ! here to avoid unwrapping everytime
    @IBOutlet weak var display: UILabel!
    
    // Have to initialize our varibles
    // Swift can infer the type
    var userIsInTheMiddleOfTypingANumber = false
    
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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×":
            /*
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
            */
            
            //performOperation(multiply)
            
            // op1, op2 type can be removed, 'cause it can be inferred from performOperation as well as return
            //performOperation({ (op1, op2) in op1 * op2 })
        
            // If you don't name op1, op2, it will use $0 ... instead
            //performOperation({ $0 * $1 })
            
            // If you have a func which take a function as parameter/argument, it is also the last paramter/argument, the closure can be taken outside the parentheses; what's more, if it is the only argument, the parentheses can be remove too
            performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        case "√": performOperation { sqrt($0) }
        default: break
        }
    }
    
    // Take a function as the parameter
    // i.e. operation is a function
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    /*
    func multiply(op1: Double, op2: Double) -> Double {
        return op1 * op2
    }
    */
    
    // Create an instance of a class
    // var operandStack: Array<Double> = Array<Double>() - bad, Swift can infer the type
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    // Computed property, no need to set the initial value
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            // newValue is like a parameter
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

