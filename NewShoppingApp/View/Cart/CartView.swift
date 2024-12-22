//
//  CartView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct CartView: View {
    @Binding var selectedTab:Int
    @Binding var previousTab:Int
    @StateObject var vm = CartViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.gray.opacity(0.2).ignoresSafeArea()
                VStack{
                    ScrollView{
                        VStack{
                            ForEach(vm.cartList){ item in
                                CartProductView(viewModel: vm, product: item.product, quantity: item.quantity)
                            }
                        }
                    }
                    .scrollIndicators(.visible)
                    .padding(.vertical, -10)
                    
                    Spacer()
                    
                    UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 10)
                        .fill(.white)
                        .frame(height: 260)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            overlayContent
                                .padding()
                        }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectedTab = previousTab
                    } label: {
                        Image(systemName: "house")
                            .tint(.black)
                    }
                    
                }
                ToolbarItem(placement:.principal) {
                    Text("My Cart")
                        .font(.title)
                        .font(.system(size: 30))
                    
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
 
    var overlayContent:some View{
        VStack(spacing: 20){
            HStack{
                Text("Subtotal")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(String(format: "$ %0.2f", vm.cartTotalPrice))
                    .font(.title2)
            }
            
            Divider()
            
            HStack{
                Text("Total")
                Spacer()
                Text(String(format: "$ %0.2f", vm.cartTotalPrice))
                    .font(.title2)
            }
            .bold()
            
            Button("CheckOut") {
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }
    }
}

#Preview {
   // CartView(selectedTab: $se)
}

#Preview {
    ContentView()
}
