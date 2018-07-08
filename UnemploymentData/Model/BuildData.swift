//
//  BuildData.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/28/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

struct BuildData {
    
    fileprivate var jsonObject = [String : AnyObject]()  // JSON OBject file
    
    fileprivate var countyArray = [String]()
    fileprivate var unemploymentRateForAllStates = [String]()
    
    /**
     The purpose of this method is read and start building the 'result.json' JSON file that will then be used with a data structure. 
     */
    mutating func readObjectData(urlLink: URL) {
        
        jsonObject = GetJSONObject.parseObject(url: urlLink)
        allCountiesForStates()
        
    }
    

    fileprivate mutating func allCountiesForStates() {
        for key in jsonObject.keys {
            allState(for: key)
            
        }
        
    }

    fileprivate mutating func allState(for year: String) {
        
        
        var allCounties = Set<String>()
        
        if let stateArray = jsonObject[year] as? NSDictionary {
            if let counties = stateArray["Annual"] as? NSDictionary {
                for (keys, values) in counties {
                    jsonObject.updateValue(values as AnyObject, forKey: keys as! String)
                    allCounties.insert(keys as! String)
                    getCountyNamesFor(state: keys as! String, year: year)
                    
                }
            }
        }
    }
    
    //MARK: - getCountyNAmesForState a
    fileprivate mutating func getCountyNamesFor(state: String, year: String)  {
        
        var allCountyArray = [String]()
        
        
        if let stateArray = jsonObject[state] as? [String : AnyObject] {
            if let toArray = stateArray["Unemployment Rate"] {
                for countyName in stateArray.values {
                    countyArray.append("\(countyName.allKeys)")
                
                }
                
                let newString = (String(countyArray[0]))
                let chartIndex = newString.index(of: "[")
                let startOfString = newString.index(chartIndex!, offsetBy: 1)

                let endOfString = newString.index(newString.endIndex, offsetBy: -3)
                let subStringOne = newString[startOfString...endOfString]

                let newArray = Array(subStringOne.split(separator: ","))

                for key in newArray {

                    allCountyArray.append(String(key))

                    for (index, value) in allCountyArray.enumerated() {

                        if index > 0 {
                            let charIndex = value.index(value.startIndex, offsetBy: 1)
                            let noSpaceString = value[charIndex..<value.endIndex]
                            if let returnedString = toArray[noSpaceString] {
                                
                                let result = ("\(year) : \(state) : \(noSpaceString) = " + "\(String(describing: returnedString ?? "NoData"))")
                                unemploymentRateForAllStates.append(result)
                            }

                        } else {
                            if let returnedString = toArray[value] {
                                let result = ("\(year) : \(state) : \(value) = " + "\(String(describing: returnedString ?? "NoData"))")
                                unemploymentRateForAllStates.append(result)
                            }
                            
                        }

                    }

                }

            }
        }
        
    }
    
    /**
    The purpose of this method is to return an array data structure of only non-nil values from the processed JSON
    */
    func create() -> [String] {
        
        let items = unemploymentRateForAllStates
        var arrayOutput = [String]()
        
        let newArray = items.filter { !$0.contains("NoData") }
    
        
        for n in newArray {
            arrayOutput.append(n)
        }
        
        return arrayOutput
    }
    
}
