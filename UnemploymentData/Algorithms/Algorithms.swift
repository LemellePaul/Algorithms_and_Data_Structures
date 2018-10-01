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
     The selectionSort algorithm is an slow sorting algorithm as it compares every element in an array for smalleset to largest element then moves the index in the correct order. The Big O notation for Selection Sort is O(n x n) because it has two basic functions 1) compare values and 2) swap values. It returns a String array. NOTE: I did speed this up by not using a Generic type. 
     - parameter array: String type.
     */
    static func selectionSort(_ a: [String]) -> [String] {
        guard a.count > 1 else { return a }

        var array = a
        for x in 0 ..< a.count - 1 {
            var lowest = x
            for y in x + 1 ..< a.count {
                if array[y] < array[lowest] {
                    lowest = y
                }
            }

            if x != lowest {
                array.swapAt(x, lowest)
            }
        }
        return array
    }
    
    /**
     A Quick Sort algorithm divides an array into sub-arrays by recursively sorting the low & high elements of the array than return a sorted Generic array
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
        var iterations = 0 // List number of iterations to find searchKey value.
        for i in 0 ..< a.count {
            if a[i] == key {
                print("Found LinearSearch searchKey in: \(iterations) iterations")
                return i
            }
            iterations += 1
        }
        return nil
    }
    
    /**
     A Binary Search algorithm that returns a targeted element by using a sorted array by comparing the target value with the middle of the array then continue searching & throwing out a range of values if the target vaalue is larger than the half of the upper range. The process is repeated until the target is found. Worse case Binary Search can take O(n) time, but uses O(1) space for any number of elements.
     - parameter s: Accepts a Generic element
     - parameter searchKey: Generic value that is the target value that will be searched in the sorted array.
     */
    static func binarySearch<T:Comparable> (array: [T], searchKey:T) -> Int? {
        var range = 0..<array.count // Get number of elements in the passed in set.
        var iterations = 0 // List number of iterations to find searchKey value.
        
        while range.startIndex < range.endIndex {
            let midpoint = range.startIndex + (range.endIndex - range.startIndex) / 2
            
            if array[midpoint] == searchKey {
                print("Found BinarySearch searchKey in: \(iterations) iterations")
                return midpoint
            } else if array[midpoint] < searchKey {
                // Throw out everything to the right.
                range = midpoint + 1..<range.endIndex
            } else {
                // Throw out everything to the left.
                range = 0..<midpoint
            }
            iterations += 1
        }
        return nil
    }
    
}
