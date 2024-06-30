//
//  NetworkManager.swift
//  SearchHeroes
//
//  Created by Лидия Пятаева on 29.06.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completon: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completon(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataModel = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completon(.success(dataModel))
                }
            } catch {
                completon(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    
    
    
}
