//
//  ViewController.swift
//  Calculator
//
//  Created by Alexander Zemskov on 19.01.2018.
//  Copyright © 2018 Alexander Zemskov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstOperand: Double = 0
    var firstOperandSet: Bool = false
    var typing: Bool = false
    var operationSign: String = ""
    var dotSet = false
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if typing {
            resultLabel.text! += sender.currentTitle!
        }else{
            if sender.currentTitle! != "0" {
                resultLabel.text! = sender.currentTitle!
                typing = true
            }
        }
    }
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        if firstOperandSet {
            equality()
        }
        operationSign = sender.currentTitle!
        firstOperandSet = true
        firstOperand = Double(resultLabel.text!)!
        typing = false
        dotSet = false
    }
    @IBAction func equalitySignPressed(_ sender: UIButton) {
       equality()
    }
    @IBAction func clearPressed(_ sender: UIButton) {
        firstOperand = 0
        firstOperandSet = false
        typing = false
        resultLabel.text! = "0"
        operationSign = ""
        dotSet = false
    }
    @IBAction func dotPressed(_ sender: UIButton) {
        if !typing {
            typing = true;
            resultLabel.text! = "0"
        }
        if !dotSet {
            resultLabel.text! += "."
            dotSet = true
        }
    }
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        if resultLabel.text!.range(of:".") == nil {
            resultLabel.text! = String(Int64(resultLabel.text!)! * -1)
        }else{
            resultLabel.text! = String(Double(resultLabel.text!)! * -1)
        }
    }
    @IBAction func sqrtPressed(_ sender: UIButton) {
        if firstOperandSet {
            equality()
        }
        resultLabel.text! = String(sqrt(Double(resultLabel.text!)!))
    }
    @IBAction func percentagePressed(_ sender: UIButton) {
        resultLabel.text! = String(Double(resultLabel.text!)! / 100)
    }
    
    func equality (){
        switch operationSign {
        case "+":
            resultLabel.text! = String(firstOperand + Double(resultLabel.text!)!)
            break;
        case "-":
            resultLabel.text! = String(firstOperand - Double(resultLabel.text!)!)
            break;
        case "✕":
            resultLabel.text! = String(firstOperand * Double(resultLabel.text!)!)
            break;
        case "÷":
            resultLabel.text! = String(firstOperand / Double(resultLabel.text!)!)
            break;
        default:
            
            break;
        }
        firstOperand = 0
        firstOperandSet = false
        typing = false
        operationSign = ""
        dotSet = false
    }
}
