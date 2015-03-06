//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by SkyeKoo on 15/3/5.
//  Copyright (c) 2015年 SkyeKoo. All rights reserved.
//

import Foundation   // Never import UI things into model!

class CalculatorBrain
{
    // Can have methods
    // Can only have computed property
    private enum Op: Printable {    // NOT INHERITANCE! It's PROTOCOL!
        case Operand(Double)    // Associate with Double
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        // Readonly, protocol
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()   // Can be operand or operator
    
    private var knownOps = [String:Op]()    // Maybe public (teach new operation)
    
    init() {
        // can put a func inside a func
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        //knownOps["×"] = Op.BinaryOperation("×") { $0 * $1 }
        //knownOps["×"] = Op.BinaryOperation("×", *)  // * is a function does times
        learnOp(Op.BinaryOperation("×", *))
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 } // Cannot be the same as the former one, for the order is different
        //knownOps["+"] = Op.BinaryOperation("+") { $0 + $1 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        //knownOps["√"] = Op.UnaryOperation("√") { sqrt($0) } // function takes 1 argument and return 1 argument
        knownOps["√"] = Op.UnaryOperation("√", sqrt)    // for sqrt take 1 argument and return 1 argument
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) { // Return tuples, can be unamed
        if !ops.isEmpty {
            // struct cannot have inheritance, and struct is passed by value
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand): // operand will have the associate value Double
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation): // Ignore the string
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evalation = evaluate(remainingOps)
                if let operand1 = op1Evalation.result {
                    let op2Evaluation = evaluate(op1Evalation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            // No need to have default case, for it already handle all the possible case
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {    // Maybe no knownOps
        let (result, remainder) = evaluate(opStack) // Return a tuple
        println("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        // Must be the known operation so that can be perform
        if let operation = knownOps[symbol] {    // operation is an optional op, for it may return nil if the symbol not exists, that is, if you look for something in the dictionary, always return nil
            opStack.append(operation)
        }
        return evaluate()
    }
}
