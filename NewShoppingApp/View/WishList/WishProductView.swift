//
//  WishProductView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 26/12/24.
//

import SwiftUI

struct WishProductView: View {
    let product:Product
    var body: some View {
        HStack{
            CustomAsyncImage(url: URL(string: product.image)!,
                             placeholder: {AnyView(ProgressView())},
                             errorView: {AnyView(Rectangle())})
            .frame(width: 100, height: 100)
            .frame(maxWidth: 150)
            
            VStack(alignment:.leading, spacing: 10){
                Text(product.title)
                    .foregroundStyle(.secondary)
                    .lineLimit(1, reservesSpace: false)
                
                HStack{
                    Text(String(format: "$%0.2f", product.price))
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                }
                HStack(spacing: 20){
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Add to Cart")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.blue)
                            }
                    }

                }
                .tint(.black)
            }
            .frame(height: 150)
            .frame(maxWidth: 300)
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    WishProductView(product: Product.sampleProduct)
}
