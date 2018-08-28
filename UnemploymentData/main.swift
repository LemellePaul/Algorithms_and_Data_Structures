//
//  main.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/21/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

let url = getJSONUrl.projectDirectory()
let benchmark = PerformanceMeasure()

var buildData = BuildData()
buildData.readObjectData(urlLink: url)
let unemploymentDataArray = buildData.create()

// Empty array that will be used to append / insert data.
var newArray = [String]()
if (!unemploymentDataArray.isEmpty) {
    
    // Search random element in the array.
    // Add elements to new array by using the append methiod, which is faster than inserting elements in the middle of an Array.
    benchmark.printTimeElapsedWhenRunningCode(title: "Appending an Array") {
        for item in unemploymentDataArray {
            newArray.append(item)
        }
    }
    
    print("The sixe of the element: \(newArray.count)")
    // Adding elements in the middle of an array is less efficent because area os memories must be changed / moved arround.
    benchmark.printTimeElapsedWhenRunningCode(title: "Inserting elements in an Array") {
        let value = newArray.count
        for item in newArray {
            newArray.insert(item, at: value - 1)
        }
    }
    
    // Search through a larger element sof the array
    let randomElement = newArray.randomElement()
    print("The sixe of the newArray element: \(newArray.count)")
    
    // Performs a linear search of the unemployment data, which can vary depending on the size of the data set.
    print("Searching.....")
    benchmark.printTimeElapsedWhenRunningCode(title: "Linear Search")  {
        for n in newArray {
            if n == randomElement ?? ""{
                print("Found item: \(n)")
                break
            }
        }
    }
    let sortedUnemploymentDataArray = newArray.sorted()
    
    print("Binary Search...")
    // Is more effiecient than simply using a linear search to find an element by using the concept of 'Divide & Conquer.'
    let binarySearchRandomElement = randomElement ?? " "
    benchmark.printTimeElapsedWhenRunningCode(title: "Binary Search")  {
        let _ = benchmark.binarySearch(sortedUnemploymentDataArray, key: binarySearchRandomElement, range: 0..<sortedUnemploymentDataArray.count)
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











