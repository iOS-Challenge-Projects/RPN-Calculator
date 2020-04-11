//
//  Stack.swift
//  RPN
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

///A simple data type representing elements as a stack of things in which the last element  "push()" to go in is the first to come out "pop()"
///Example: myStack: Stack<Int> = [1,2,3]
///Element: is a placeholder for a generic type
///ExpressibleByArrayLiteral: is a protocol which allow user to create a stack directly instead of creating an array and then converting it to a stack
struct Stack<Element>: ExpressibleByArrayLiteral {

    //MARK: - Properties
    
    //Array of type Element
    var elements: [Element]
    
    //ExpressibleByArrayLiteral required
    typealias ArrayLiteralElement = Element
    
    //ExpressibleByArrayLiteral required
    internal init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        self.elements = elements
    }
    
    //MARK: - Methods
    
    
    /// Add elements to the stack
    /// - Parameter element: The element to be added to the top of the stack
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    
    /// Removes the most recent element from the stack
    /// - Returns: The element that was removed or nil if there was no element left
    mutating func pop()-> Element? {
        return elements.popLast()
    }
    
    
    /// Get most recent element in the stack
    /// - Returns: Most recent element in stack
    func peek() -> Element? {
        return elements.last
    }
}
