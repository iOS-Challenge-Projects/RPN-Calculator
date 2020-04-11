//
//  Stack.swift
//  RPN
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

//Element is a generic
//ExpressibleByArrayLiteral is a protocol which requires ArrayLiteralElement

struct Stack<Element>: ExpressibleByArrayLiteral {

    //MARK: - Properties
    
    var elements: [Element]
    
    typealias ArrayLiteralElement = Element
    
    
    internal init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        self.elements = elements
    }
    
    //MARK: - Methods
    
    mutating func push(_ element: Element) {
        
    }
    
    mutating func pop()-> Element? {
        return 0 as? Element
    }
    
    func peek() -> Element? {
        return 0 as? Element
    }
}
