//
//  NetworkService.swift
//  Navigation
//
//  Created by Valeriya Trofimova on 03.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct NetworkService {
    
    static func makeRequest(url: URL) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else { return }
            print(String(decoding: data, as: UTF8.self))
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print("\n\n response = \(httpResponse.allHeaderFields) ; \(httpResponse.statusCode) \n")
            
            guard error != nil else { return }
            print(error.debugDescription)
            // ошибка - 1009 
        }
        task.resume()
    }
}
