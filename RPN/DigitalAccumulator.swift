//
//  DigitalAccumulator.swift
//  RPN
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

struct DigitAccumulator {
    enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    
    /// Add new digit to the accumulator, throws an error if digit is invalid.
    /// - Parameter digit: Digit to add
    mutating func add(digit: Digit) throws {
        
    }
    
    
    /// Grab the value out of the digit Accumulator
    /// - Returns: The value represented by the Digit Accumulator, or nil if it cannot be interpreted as a double
    func value() -> Double {
        return 00.00
    }
    
    
    /// Reset the accumulator
    mutating func clear()  {
        
    }
}
