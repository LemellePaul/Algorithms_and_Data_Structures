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
var unemploymentDataArray = buildData.create()
let unemploymentDataSet = buildData.createSet()

// Empty array that will be used to append / insert data.
if (!unemploymentDataArray.isEmpty && !unemploymentDataSet.isEmpty) {
    print("The array data structure stored elements: \(unemploymentDataArray.count)")
    print("The set data structure stored elements: \(unemploymentDataSet.count)")
    
    // Verify that the elements are truly unique, or just a false positive problem.
    let uniqueDescString = """
    Verify that elements in the array & set data structures are truly unique.
    The Swift symmetricDifference method will compare the two data structures, and return only unique elements.

    Append a made up value that is not in the append then use the 'symmetricDifference' only returns the appended value.
    """
    print(uniqueDescString)
    let madeUpValue = "2013 : Utah : Sevier County = 7.8"
    unemploymentDataArray.append(madeUpValue)
    let valuesNotInBoth = unemploymentDataSet.symmetricDifference(unemploymentDataArray)
    if valuesNotInBoth.contains(madeUpValue) {
        print("The symmetricDifference method returned the correct value: \(valuesNotInBoth)")
    } else {
        print("Error: The 'symmetricDifference' method did not return the expected value")
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











