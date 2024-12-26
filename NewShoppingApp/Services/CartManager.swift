//
//  CartManager.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 29/11/24.
//

import Foundation

class CartManager:ObservableObject{
    
    static let shared = CartManager()
    @Published var cartItems:[CartItem] = []
    
    private init(){ }
    
    
    func addToCart(product:Product){
        if cartItems.contains(where: { $0.product.id == product.id}){
            return
        }else{
            let cartItem = CartItem(product: product, quantity: 1)
            cartItems.append(cartItem)
        }
    }
    
    func deleteCartItem(product:Product){
        cartItems.removeAll { CartItem in
            CartItem.id == product.id
        }
    }
    
    func incrementQuantity(product:Product){
        if let index = cartItems.firstIndex(where: { $0.id == product.id}){
            cartItems[index].quantity += 1
        }
    }
    
    func decrementQuantity(product:Product){
        if let index = cartItems.firstIndex(where: { $0.id == product.id}){
            if cartItems[index].quantity > 1{
                cartItems[index].quantity -= 1
            }
        }
    }
}
