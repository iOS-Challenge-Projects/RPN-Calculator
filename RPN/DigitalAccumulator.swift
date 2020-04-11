//
//  DigitalAccumulator.swift
//  RPN
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

public enum DigitAccumulatorError: Error {
    case invalidNumberValue
    case extraDecimalPoint
}

public struct DigitAccumulator {
    
    //MARK: - Properties
    
    private var digits: [Digit] = []
    
    public enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    public init(){}
    
    //MARK: - Methods
    
    /// Add new digit to the accumulator, throws an error if digit is invalid.
    /// - Parameter digit: Digit to add
    /// - Throws: DigitAccumulatorError
    public mutating func add(digit: Digit) throws {
        
        //Switch prevents we add invalid digits to the digits array
        //So if the digit pass in the argument will be checked with guard
        //if it throws then we never get to add it to the array
        switch digit {
        case .number(let value):
            guard value >= 0 && value <= 9 else {
                throw DigitAccumulatorError.invalidNumberValue
            }
        case .decimalPoint:
            guard !digits.contains(.decimalPoint) else{
                throw DigitAccumulatorError.extraDecimalPoint
            }
        }
        
     
        digits.append(digit)
    }
    
    
    /// Grab the value out of the digit Accumulator
    /// - Returns: The value represented by the Digit Accumulator, or nil if it cannot be interpreted as a double
    public func value() -> Double? {
        
        let stringValue = digits.reduce("") { (result, digit) -> String in
            
            switch digit {
            case .number(let value):
                return result + String(value)
            case .decimalPoint:
                return result + "."
            }
        }
        return Double(stringValue)
    }
    
    
    /// Reset the accumulator
    public mutating func clear()  {
        digits.removeAll()
    }
}
