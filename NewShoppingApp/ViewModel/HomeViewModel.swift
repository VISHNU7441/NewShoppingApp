//
//  ShoppingAppViewModel.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 19/10/24.
//

import Foundation


class HomeViewModel: ObservableObject{
    
    private var allProducts:[Product] = []
    @Published var listOfProducts:[Product] = []
    @Published var listOfSearchProducts:[Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    
    @Published var searchTerm:String = ""
    private var searchTask:Task<Void, Error>?
    
    let manager = CartManager.shared
    private let productService = ProductService()

    // MARK: - function to fetchData from DataBase
    
    @MainActor
    func fetchData() async {
        isLoading = true
        errorMessage = nil
        
        let result = await productService.fetchProducts()
        
        isLoading = false
        switch result {
        case .success(let products):
            self.allProducts = products
            self.listOfProducts = allProducts
            print("fetching successful")
        case .failure(let error):
            switch error {
            case .invalidURL:
                self.errorMessage = "Invalid URL"
            case .invalidResponse:
                self.errorMessage = "Invalid response from the server"
            case .decodingError:
                self.errorMessage = "Failed to decode the data"
            case .unknown(let underlyingError):
                self.errorMessage = "An unknown error occurred: \(underlyingError.localizedDescription)"
            }
            print("Error fetching data: \(errorMessage ?? "Unknown error")")
        }
    }
    
    // MARK: Update listOfProducts based on Category
    
    func setListOfProducts(category:Category){
        
        if category == .all{
            listOfProducts = allProducts
        }else{
            listOfProducts = allProducts.filter{
                $0.category == category.rawValue
            }
        }
        
    }
    
    // MARK: Search function 
    
    func searchFilter(){
        
        let productsHasPrefix = allProducts.filter {
            $0.title.lowercased().hasPrefix(searchTerm.lowercased())
        }
        
        let productsThatHasOtherMatches = allProducts.filter{
            !$0.title.lowercased().hasPrefix(searchTerm.lowercased()) && $0.title.lowercased().contains(searchTerm.lowercased())
        }
        
        listOfSearchProducts = productsHasPrefix + productsThatHasOtherMatches
        
    }
    
    
    // MARK: Debounce function for calling search filter
    
    func debounce(){
        searchTask?.cancel()
        
        searchTask = Task{
            
            try? await Task.sleep(nanoseconds: 500_000_000)
            
            if !Task.isCancelled{
                // call the actual search filter function
                searchFilter()
            }
        }
        
    }
    
    func addProductToCart(product:Product){
        manager.addToCart(product: product)
    }
    
}


