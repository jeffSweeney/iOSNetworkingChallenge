//
//  LectureModel.swift
//  iOSNetworkingChallenge
//
//  Represents the ViewModel of the app
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import Foundation

class LectureModel: ObservableObject {
    @Published var lectures = [Lecture]()
    
    init() {
          ingestLectures()
    }
    
    private func ingestLectures() {
        // Get URL from hosted JSON
        let url = URL(string: Constants.HostedJSON)
        
        // Guard against nil
        guard url != nil else {
            return
        }
        
        // Get the URLRequest
        let urlRequest = URLRequest(url: url!)
        
        // Define and start the task
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, request, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            // Data should be defined if reached. Guard just in case.
            guard data != nil else {
                print("Data unexpectedly nil")
                return
            }
            
            // Decode JSON
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode([Lecture].self, from: data!)
                
                // Force main thread to update the published field
                DispatchQueue.main.async {
                    self.lectures += results
                }
            } catch {
                print(error)
            }
        })
        
        task.resume()
    }
}
