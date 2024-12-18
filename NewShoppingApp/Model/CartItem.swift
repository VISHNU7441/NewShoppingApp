//
//  CartItem.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 29/11/24.
//

import Foundation


struct CartItem:Identifiable,Equatable{
    let product:Product
    var quantity:Int
    var totalPrice: Double{
        let price = product.price * Double(quantity)
        return price
    }
    
    var id: Int{
        return product.id
    }
}
