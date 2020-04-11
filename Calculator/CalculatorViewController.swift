//
//  ViewController.swift
//  Calculator
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit
import RPN

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    
    @IBOutlet var textField: UITextField!
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        formatter.maximumIntegerDigits = 20
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 20
        return formatter
     }()
    
    //Initialize calculator struct and since is a struct we can monitor everytim it changes with didSet
    private var calculator = Calculator() {
        didSet {
            if let value = calculator.topValue{
                textField.text = numberFormatter.string(from: value as NSNumber)
            }else {
                textField.text = ""
            }
        }
    }
    
    private var digitAccmulator = DigitAccumulator() {
        didSet{
            if let value = digitAccmulator.value(){
                textField.text = numberFormatter.string(from: value as NSNumber)
            }else {
                textField.text = ""
            }
        }
    }
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterNumericDigit(_ sender: UIButton){
        let numericDigit = sender.tag
        try? digitAccmulator.add(digit: .number(numericDigit))
    }
    
    @IBAction func enterDecimal(_ sender: UIButton){
        try? digitAccmulator.add(digit: .decimalPoint)
    }
    
    @IBAction func saveNumberToCalculator(_ sender: UIButton){
        if let value = digitAccmulator.value(){
            calculator.push(value)
        }
        digitAccmulator.clear()
    }
    
    @IBAction func addAccumulatorResults(_ sender: UIButton){
        calculator.push(operator: .add)
    }
    
    @IBAction func subtractAccumulatorResults(_ sender: UIButton){
        calculator.push(operator: .subtract)
    }
    
    @IBAction func multiplyAccumulatorResults(_ sender: UIButton){
        calculator.push(operator: .multiply)
    }
    
    @IBAction func devideAccumulatorResults(_ sender: UIButton){
        calculator.push(operator: .devide)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        calculator.clearStack()
        digitAccmulator.clear()
        return true
    }
}

