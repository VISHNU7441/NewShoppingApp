//
//  WishList.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 03/12/24.
//

import SwiftUI

struct WishList: View {
    @StateObject var viewModel = wishListViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:15){
                    ForEach(viewModel.wishList){ item in
                        WishProductView(product: item)
                        Divider()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WishList()
}
