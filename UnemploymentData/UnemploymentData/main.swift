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
var newArray = [String]()
if (!unemploymentDataArray.isEmpty) {
    
    // Example of using O(1) Constant time when reading an element in an array.
    print("Example of using Constant O(1) for reading a specific element of an array")
    print("Reading element 20 in index 21 returns: \(unemploymentDataArray[21])")
    let middleElement = unemploymentDataArray.count / 2
    if middleElement % 2 == 0 {
        print("Reading the middle element: \(unemploymentDataArray[middleElement])\n")
    } else {
         print("Reading the element: \(unemploymentDataArray[middleElement - 1])\n")
    }
    
    // Example of an Linear Simple Search algorithm
    // 1) Let's pick an element in the unemploymentDataArray
    // 2) Use a for loop to perform the Linear Search.
    print("Example of using O(n) with a Linear Search")
    let elementToFind = unemploymentDataArray.randomElement()
    if let item = elementToFind {
        print("The random element that will be searched: \(item)\n")
        let _ =  Algorithms.linearSearch(unemploymentDataArray, item)
    } else {
        print("Error: Reading the array - oops..")
    }
    
    // Add elements to new array by using the append method, which is faster than inserting elements in the middle of an Array.
    print("Example of appending elements to the end of an array, which is faster than inserting elements at the start or middle of an array\n")
    for item in unemploymentDataArray {
        newArray.append(item)
    }

    // Add elements to new array by using the append methiod, which is faster than inserting elements in the middle of an Array.
    print("Example of O(n)+1 by adding an element at the start of an array")
    print("\(newArray[newArray.startIndex]) at the start of the array before inserting at the start of an array")
    if let item = elementToFind {
        newArray.insert(item, at: newArray.startIndex)
        print("\(newArray[newArray.startIndex]) at the start of the array AFTER inserting to the start of the array\n")
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











