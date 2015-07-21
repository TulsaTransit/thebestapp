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
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleofTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInMiddleofTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        if userIsInMiddleofTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
        
    }

    
    @IBAction func enter() {
        userIsInMiddleofTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
        
    }

    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInMiddleofTypingANumber   = false
        }
    }
    
    
    
    
    
    
    
         
        
}

