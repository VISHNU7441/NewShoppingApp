//
//  ContentView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = CartManager.shared
    @State var selectedTab:Int = 0
    @State var previousTab:Int = 0
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem {
                    Label("home", systemImage: "house")
                }
                .tag(0)
            
            WishList()
                .tabItem {
                    Label("Fav", systemImage: "heart")
                }
                .tag(1)
            
            CartView(selectedTab: $selectedTab, previousTab: $previousTab)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                      
                }
                .tag(2)
                .badge(manager.cartItems.count)
            
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            previousTab = oldValue
        }
    }
}

#Preview {
    ContentView()
}
