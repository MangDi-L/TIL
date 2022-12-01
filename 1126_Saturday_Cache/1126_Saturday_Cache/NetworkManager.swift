//
//  NetworkManager.swift.swift
//  1126_Saturday_Cache
//
//  Created by Mangdi on 2022/11/26.
//

import Foundation

struct NetworkManager {
    let session = URLSession(configuration: .default)
    
    func loadingImage(url: String, completionHandler: @escaping (Data) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = session.dataTask(with: url) { data, response, error in
            guard let response = response else { return }
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            completionHandler(data)
            
        }
        task.resume()
    }
}
