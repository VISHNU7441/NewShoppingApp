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
    
    
   // MARK:- function to fetchData from DataBase
    
    func fetchData() async {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw URLError.invalidResponse}
            
            let products = try JSONDecoder().decode([Product].self, from: data)
            
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
    
    // MARK:- Update listOfProducts based on Category
    
    func setListOfProducts(category:Category){
        
        if category == .all{
            listOfProducts = allProducts
        }else{
            listOfProducts = allProducts.filter{
                $0.category == category.rawValue
            }
        }
        
    }
    
}






