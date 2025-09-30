//
//  NetworkManager.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import Foundation

class NetworkManager {
    
    func createRequest(baseURL: BaseURL,endpoint: EndPoint, httpMethod: HttpMethod, body: Data?, completion: @escaping (Data?, Error?) -> Void){
        
        let url = URL(string: "\(baseURL.rawValue)\(endpoint.rawValue)")
        
        guard let url = url else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        if let body = body{
            urlRequest.httpBody = body
        }
        
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            
            if let data = data {
                completion(data, nil)
            }else {
                completion(nil, error)
            }
        }
        .resume()
    }
}
