//
//  NetworkManager.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 29/11/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case unknown(Error)
}

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func fetchData<T: Decodable>(from urlString: String) async -> Result<T, NetworkError> {
        guard let url = URL(string: urlString) else {
            return .failure(.invalidURL)
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(.invalidResponse)
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure(.decodingError)
            }
        } catch {
            return .failure(.unknown(error))
        }
    }
}
