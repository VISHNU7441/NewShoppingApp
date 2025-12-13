//
//  ProductService.swift
//  NewShoppingApp
//
//  Created by Jules on 29/11/24.
//

import Foundation

class ProductService {

    private let networkManager = NetworkManager.shared

    func fetchProducts() async -> Result<[Product], NetworkError> {
        let urlString = "https://fakestoreapi.com/products"
        return await networkManager.fetchData(from: urlString)
    }
}
