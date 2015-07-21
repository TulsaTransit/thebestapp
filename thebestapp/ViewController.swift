//
//  ViewController.swift
//  thebestapp
//
//  Created by Harold Kurth on 7/17/15.
//  Copyright (c) 2015 Harold Kurth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsInMiddleofTypingANumber : Bool = false
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleofTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInMiddleofTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInMiddleofTypingANumber  = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    @IBAction func operand(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleofTypingANumber{
            enter()
        }
        switch operation{
            case "✖️":
                if operandStack.count >= 2{
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
            }
//            case "➗":
//            case "➕":
//            case "➖":
            default: break
            
        }
    }
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set{
            display.text = "\(newValue)"
            userIsInMiddleofTypingANumber = false
        }
    }

}

