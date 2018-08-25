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
let benchmark = PerformanceMeasure()

if (!unemploymentDataArray.isEmpty) {
    // Search random element in the array.
    let unemploymentDataLength = unemploymentDataArray.count
    let randomValue = arc4random_uniform(UInt32(unemploymentDataLength))
    let randomElement = unemploymentDataArray[Int(randomValue)]
    
    // Performs a linear search of the unemployment data.
    print("Searching.....")
    let _ = benchmark.startTime
    for n in unemploymentDataArray {
        if n.contains(randomElement) {
            print("Found item: \(n)")
            var _ = benchmark.stop()
            break
        }
    }
    let runningTime = benchmark.duration
    print("Time duration: \(runningTime ?? 0.00)")
} else {
    print("Please run again ")
}










