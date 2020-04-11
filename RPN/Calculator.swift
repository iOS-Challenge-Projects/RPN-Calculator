//
//  Calculator.swift
//  RPN
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation


public struct Calculator {
    
    public enum Operator {
        case add
        case subtract
        case multiply
        case devide
    }
    
    private var stack: Stack<Double> = [0.0,0.0]
    
    public init () {}
    
    
    private mutating func push(_ number: Double)  {
        stack.push(number)
    }
    
    
    public mutating func push(operator: Operator) {
        let element1 = stack.pop() ?? 0.0
        let element2 = stack.pop() ?? 0.0
        
        let result: Double
    
        switch `operator` {
        case .add:
            result = element1 + element2
        case .subtract:
            result = element1 - element2
        case .multiply:
            result = element1 * element2
        case .devide:
            result = element1 / element2
        }
        stack.push(result)
    }
    
    public var topValue: Double? {
        return stack.peek()
    }
    
    public mutating func clearStack(){
        stack = []
    }
}
