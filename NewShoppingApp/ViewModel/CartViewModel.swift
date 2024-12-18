//
//  CartViewModel.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 02/12/24.
//

import SwiftUI
import Combine

class CartViewModel:ObservableObject{
    @Published var cartList:[CartItem] = []
    @Published var cartTotalPrice:Double = 0
    
    private var cancellables: Set<AnyCancellable> = []
    let manager = CartManager.shared
    
    init(){
        updateCartList()
    }
    
    func updateCartList(){
        manager.$cartItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] itemsList in
                self?.cartList = itemsList
                self?.cartTotalPrice = itemsList.reduce(0){ $0 + $1.totalPrice}
            }
            .store(in: &cancellables)
    }
    
    func removeProductFromCart(product:Product){
        manager.deleteCartItem(product: product)
    }
    
    func incrementTheProductQuantity(product:Product){
        manager.incrementQuantity(product: product)
    }

}
