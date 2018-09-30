//
//  Algorithms.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 8/28/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

struct Algorithms {
    
    /**
     A Linear Search or Simple Search algorithm that returns a targeted element by searching through all elements of an array or collection. Typically thought of as the worse way to search because the time to find an element depends on the number of elements in the array. Worse case Linear Search can take O(n) time amd consuem an equal amount of space.
     - parameter a: Generic array.
     - parameter key: Generic value that is the target value that will be searched in the sorted array.
     */
    static func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
        for i in 0 ..< a.count {
            if a[i] == key {
                return i
            }
        }
        return nil
    }
    
}
