//
//  GetJSONObject.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/28/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation


enum ErrorToThorw: Error {
    case ReadingFile
}

/**
 The purpose of this method is to read the contents of the JSON File and return [String : AnyObject] object. 
 */
struct GetJSONObject {
    
    static public func parseObject(url: URL) -> [String : AnyObject] {
        
        var jsonData = [String : AnyObject]()
        
        do {
            let data = try Data(contentsOf: url)
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
            jsonData = object
        } catch ErrorToThorw.ReadingFile {
            print("Error: Reading JSON File")
        } catch {
            print("Error: Unknown")
        }
        
        return jsonData
    }
    
    
}

