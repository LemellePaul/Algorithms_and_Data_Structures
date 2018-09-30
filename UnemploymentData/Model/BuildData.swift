//
//  BuildData.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/28/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

struct BuildData {
    
    // JSON OBject file
    fileprivate var jsonObject = [String : AnyObject]()
    
    // Array to store counties per state.
    fileprivate var countyArray = [String]()
    
    // Array to store all states & counties for the number of years.
    fileprivate var unemploymentRateForAllStates = [String]()
    
    /**
     The purpose of this method is read and start building the 'result.json' JSON file that will then be used with a data structure. 
     */
    mutating func readObjectData(urlLink: URL) {
        
        jsonObject = GetJSONObject.parseObject(url: urlLink)
        allCountiesForStates()
    }
    
    /**
     The purpose of this method is to create an array of all of the States that will be used as dictionary keys.
     */
    fileprivate mutating func allCountiesForStates() {
        for key in jsonObject.keys {
            allState(for: key)
        }
    }
    
    /**
     The purpose of this method is to construct the 'jsonObject' & 'allCounties'data structures with State & County data from the JSON file. And to to load data into the 'getCountyNamesFor' method.
     - parameter year: Takes a String value that is used as the key year for the JSON file.
     */
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
    
    //MARK: - Clean the Data from the JSON File.
    /**
     The purpose of this method is to clean the data generated from the json file to be processed into an useable data structure.
     - parameter year: Takes a String value that is used as the key for a given year.
     - parameter state: Takes a String value that is used to read the counties for a given state.
     */
    fileprivate mutating func getCountyNamesFor(state: String, year: String)  {
        
        var allCountyArray = [String]()
        
        
        if var stateArray = jsonObject[state] as? [String : AnyObject] {

            let keyString = "Unemployment Rate"
            
            // Work around for an issue when procesisng the JSON that will fail depending on the order of the key returned. So, added a filter to return only dictionary with the correct key.
            let tempDict = stateArray.filter { $0.key.contains(keyString) }
            let key = stateArray[keyString]
            
            
            if let toArray = key  {
                for countyName in tempDict.values {
                    countyArray.append("\(countyName.allKeys)")
                
                }
                
                let newString = (String(countyArray[0]))
                let chartIndex = newString.index(of: "[")
                let startOfString = newString.index(chartIndex!, offsetBy: 1)

                let endOfString = newString.index(newString.endIndex, offsetBy: -3)
                let subStringOne = newString[startOfString..<endOfString]

                let newArray = Array(subStringOne.split(separator: ","))

                for key in newArray {

                    allCountyArray.append(String(key))

                    for (index, value) in allCountyArray.enumerated() {

                        // Condition check to handle a space character that only 
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
    
    /**
     The purpose of this method is to return a set data structure of only non-duplicte values from the processed JSON
     */
    func createSet() -> Set<String> {
        
        let items = unemploymentRateForAllStates
        var arrayOutput =  Set<String>()
        
        let newArray = items.filter { !$0.contains("NoData") }
        
        
        for n in newArray {
            arrayOutput.insert(n)
        }
        
        return arrayOutput
    }

    
}
