//
//  CoronaData.swift
//  PocketFauci
//
//  Created by Danny Park on 4/19/22.
//

import Foundation

class CoronaData {

    var stateArray: [StateData] = []
    var urlString = "https://api.covidtracking.com/v1/states/current.json"
    
    func getData(completed: @escaping() -> ()) {
        print("We are accessing the url \(urlString)")
        
        //Create a URL
        guard let url = URL(string: urlString) else {
            print("Error: Could not create a url from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print ("ERROR")
            }
            
            //Deal with data
            do {
                self.stateArray = try JSONDecoder().decode([StateData].self, from: data!)
            } catch {
                print ("JSON ERROR")
            }
            completed()
        }
        task.resume()
    }
}
