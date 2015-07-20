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
    
    @IBAction func enter() {
        userIsInMiddleofTypingANumber  = false
        
    }

}

