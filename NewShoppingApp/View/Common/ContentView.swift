//
//  ContentView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = CartManager.shared
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("home", systemImage: "house")
                }
            
            WishList()
                .tabItem {
                    Label("Fav", systemImage: "heart")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                      
                }
                .badge(manager.cartItems.count)
            
        }
    }
}

#Preview {
    ContentView()
}
