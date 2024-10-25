//
//  Product.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import Foundation


struct Product:Codable, Identifiable{
    let id:Int
    let title:String
    let price:Double
    let description:String
    let category:String
    let image:String
    let rating:Rating
    
    static var sampleProduct = Product(id: 1,
                                       title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                                       price: 109.95,
                                       description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                       category: "men's clothing",
                                       image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                       rating: Rating(rate: 3.9, count: 120))
    
}

struct Rating:Codable{
    let rate:Double
    let count:Int
}
