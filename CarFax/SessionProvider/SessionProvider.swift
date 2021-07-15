//
//  SessionProvider.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import Foundation

class SessionProvider {
    func request<T: Decodable>(_ url: URL? , type: T.Type, handler: @escaping (T?, Error?) -> ()) {
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                handler(nil, error)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                handler(json, nil)
            } catch (let error) {
                print("Parsing error %@", error)
            }
        }
        
        task.resume()
    }
}
