//
//  main.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/21/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

let url = getJSONUrl.projectDirectory()

var buildData = BuildData()
buildData.readObjectData(urlLink: url)
let unemploymentDataArray = buildData.create()

// Empty array that will be used to append / insert data.
if (!unemploymentDataArray.isEmpty) {
    
    if let searchkey = unemploymentDataArray.randomElement() {
        
        let searchDescription = """
        To illustrate the difference in doing a binary search and linear search, a random element was choosen from an array: \(searchkey).
        The number of iterations that will be used to find the searchkey will be displayed.
        """
        print(searchDescription)
        let sortedArray = unemploymentDataArray.sorted()
        print("Linear Search...")
        let _ = Algorithms.linearSearch(sortedArray, searchkey)
        print("Binary Search...")
        let _ = Algorithms.binarySearch(array: sortedArray, searchKey: searchkey)
        
        // Selection Sort
        print("Starting Seletion Sort algorithm to sort the 'unemploymentDataArray'. Warning: This is slow, so please give it time. ")
        let _ = Algorithms.selectionSort(unemploymentDataArray)  // NOTE: I do notthing with the results, but feel free to replace the _ with a value then print it out to see the sorted array.
        print("Finally, done. Sorry for the fan noise. ")
        // Quick Sort
        print("Starting Quick Sort algorithm to sort the 'unemploymentDataArray'. ")
        let _ = Algorithms.quicksort(unemploymentDataArray)
        print("Done. And look, no fan noise....")
    }
} else {
    print("Please run again ")
}


extension Array {
    func randomElement() -> Element {
        let arrayLength = self.count
        let randomValue = arc4random_uniform(UInt32(arrayLength))
        let randomElement = self[Int(randomValue)]
        return randomElement
    }
}











