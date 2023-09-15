//
//  CategoryDetail.swift
//  TruckerCanada
//
//  Created by Nikolai Eremenko on 15.09.2023.
//

import Foundation

class CategoryDetail: Codable {
    
    func getData() {
        let urlString = "https://truckercanada.com/site.json"
        print("Info: Accessing the \(urlString)")
        
        // Create URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create URL from \(urlString)")
            return
        }
        
        // Create URLSession
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        // Configure request authentication
        request.setValue(APIKeys.truckerCanadaKey, forHTTPHeaderField: "Api-Key")
        request.setValue("system", forHTTPHeaderField: "Api-Username")
        
        // Create the HTTP request
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else if let data = data {
                // Handle HTTP request response
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("\(json)")
                } catch {
                    print("JSON ERROR: \(error.localizedDescription)")
                }
            } else {
                // Handle unexpected error
                print("ERROR: Unknown error")
            }
        }
        
        task.resume()
        
    }
}

