//
//  PerformanceMeasure.swift
//  UnemploymentData
//
// 
// NOTE:  The 'printTimeElapsedWhenRunningCode(_)' came from Stack Overflow.

import CoreFoundation

class PerformanceMeasure {
    
    func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) s.")
    }
    
}
