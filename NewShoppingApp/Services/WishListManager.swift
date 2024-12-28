//
//  WishListManager.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 28/12/24.
//

import Foundation

class WishListManager:ObservableObject{
    static let shared = WishListManager()
    @Published var wishList:[Product] = []
    
    private init(){ }
    
    func addToWishList(product:Product){
        if wishList.contains(where: {$0.id == product.id}){
            return
        }
        else{
            wishList.append(product)
        }
    }
    
    func removeProductFromWishList(product:Product){
        wishList.removeAll { wishItem in
            wishItem.id == product.id
        }
    }
    
}
