//
//  ShoppingAppViewModel.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 19/10/24.
//

import Foundation


class ShoppingAppViewModel: ObservableObject{
    
    private var allProducts:[Product] = []
    @Published var listOfProducts:[Product] = []
    @Published var listOfSearchProducts:[Product] = []
    
    
    @Published var searchTerm:String = ""
    private var searchTask:Task<Void, Error>?
    
    // MARK: - function to fetchData from DataBase
    
    func fetchData() async {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw URLError.invalidResponse}
            
            let products = try JSONDecoder().decode([Product].self, from: data)
            
         //   downloadJSONToOffline(data: data, fileName: "fakeProducts")
            
            await MainActor.run {
                self.allProducts = products
                self.listOfProducts = allProducts
            }
            print("fetching successful")
            
        }
        catch {
            
            if let urlError = error as? URLError{
                print("error: \(urlError.rawValue)")
            }else{
                print(error.localizedDescription)
            }
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
    
    
    
}


