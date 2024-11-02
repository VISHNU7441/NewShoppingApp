//
//  CategoryType.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 20/10/24.
//

import Foundation


enum Category:String, CaseIterable{
    case all = "all category"
    case electronics = "electronics"
    case jewellery = "jewelery"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
}

// For building CategoryView()
struct CategoryItem:Identifiable{
    let id = UUID()
    let title:String
    let image:String
    let categoryType:Category
}









