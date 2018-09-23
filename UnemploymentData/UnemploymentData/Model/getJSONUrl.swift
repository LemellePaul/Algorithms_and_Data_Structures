//
//  getJSONUrl.swift
//  UnemploymentData
//
//  Created by Paul Lemelle on 5/21/18.
//  Copyright © 2018 Paul Lemelle. All rights reserved.
//

import Foundation

struct getJSONUrl {
    
    /**
     The purpose of this method is verify that the 'result.json' file is in the project directory of the user's folder and return the url of the file.  NOTE: I did not place the file into the project because I really don't like beach balls...
     */
    static func projectDirectory() -> URL {
        // Get the calling path of the 'main.swfit' and return its file path in an array
        let filePathOfMainArray: [String] = #file.split(separator: "/").map({String($0)})
        let userWorkingDirectorySlice = filePathOfMainArray.dropLast()
        let userDirectoryPath = userWorkingDirectorySlice.joined(separator: "/")
        let jsonDirectoryPath = "/\(userDirectoryPath)/result.json"
        
        
        let url = URL(fileURLWithPath: jsonDirectoryPath)
        
        // Verify the file exists in the directory.
        let exists: Bool
        do {
            exists = try url.checkResourceIsReachable()
            
        } catch {
            exists = false
            print("Verify that the 'result.json' file is located in the project/model folder")
            print(error.localizedDescription)
        }
        print("File Found: \(exists)\n")
        print("processing....")
        return url
    }
}
