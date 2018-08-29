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
     A Quick Sort algorithm divides an array into sub-arrays by recursively sorting the low & high elements of the array than return a sorted array
     - parameter a: Generic array.
     */
    static func quicksort<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else { return a }
        
        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot }
        let equal = a.filter { $0 == pivot }
        let greater = a.filter { $0 > pivot }
        
        return quicksort(less) + equal + quicksort(greater)
    }
    
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
    
    /**
     A Binary Search algorithm that returns a targeted element by using a sorted array by comparing the target value with the middle of the array then continue searching & throwing out a range of values if the target vaalue is larger than the half of the upper range. The process is repeated until the target is found. Worse case Binary Search can take O(n) time, but uses O(1) space for any number of elements.
     - parameter a: Generic array.
     - parameter key: Generic value that is the target value that will be searched in the sorted array.
     - parameter range: The range of the array to start & end against for the search.
     */
    static func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            // If we get here, then the search key is not present in the array.
            return nil
        } else {
            // Calculate where to split the array.
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            
            // Is the search key in the left half?
            if a[midIndex] > key {
                return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
                
                // Is the search key in the right half?
            } else if a[midIndex] < key {
                return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
                
                // If we get here, then we've found the search key!
            } else {
                return midIndex
            }
        }
    }
}
