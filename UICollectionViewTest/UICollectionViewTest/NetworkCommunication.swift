//
//  NetworkCommunication.swift
//  OpenMarket
//
//  Created by Mangdi, Woong on 2022/11/16.
//

import Foundation

struct NetworkCommunication {
    let session = URLSession(configuration: .default)
    
    func requestHealthChecker(url: String, completionHandler: @escaping (Result<HTTPURLResponse, Error>) -> ()) {
        guard let url: URL = URL(string: url) else { return }
        
        let task: URLSessionDataTask = session.dataTask(with: url) { _, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                completionHandler(.success(response))
            }
        }
        task.resume()
    }
    
    func requestProductsInformation<T: Decodable>(
        url: String,
        type: T.Type,
        completionHandler: @escaping (Result<Any, Error>) -> ()
    ) {
        guard let url: URL = URL(string: url) else { return }
        
        let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if !(200...299).contains(response.statusCode) {
                    print("URL요청 실패 : \(response.statusCode)")
                    return
                }
            }
            
            guard let data = data else { return }
            
            do {
                let decodingData = try JSONDecoder().decode(type.self, from: data)
                if type == SearchListProducts.self {
                    guard let searchListProducts = decodingData as? SearchListProducts else { return }
                    completionHandler(.success(searchListProducts))
                }
                
                if type == DetailProduct.self {
                    guard let detailProduct = decodingData as? DetailProduct else { return }
                    completionHandler(.success(detailProduct))
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
