//
//  WishListViewModel.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 28/12/24.
//

import SwiftUI
import Combine

class wishListViewModel:ObservableObject{
    @Published var wishList:[Product] = []
    
    private var cancellable: Set<AnyCancellable> = []
    let wishListManager = WishListManager.shared
    
    init(){
        updateWishList()
    }
    
    func updateWishList(){
        wishListManager.$wishList
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] wishList in
                self?.wishList = wishList
                
            }
            .store(in: &cancellable)
    }
}
