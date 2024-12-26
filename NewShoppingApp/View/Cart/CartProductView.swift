//
//  CartProductView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 29/11/24.
//

import SwiftUI

struct CartProductView: View {
    @ObservedObject var viewModel:CartViewModel
    let product:Product
    let quantity:Int
    var body: some View {
        HStack{
            // custom Image loader for the product view.
            CustomAsyncImage(
                url: URL(string: product.image)!,
                placeholder: { AnyView(ProgressView()) },
                errorView: { AnyView(Rectangle().fill(.red)) }
            )
            .frame(width: 50, height: 50)
            .padding(.leading, 10)
            .padding(.trailing)
            
            VStack(alignment:.leading, spacing: 7){
                Text(product.title)
                    .foregroundStyle(.primary)
                    .bold()
                    .lineLimit(1, reservesSpace: true)
                    
                Text(product.category)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                
                HStack(spacing: 10){
                    Text(String(format: "$%0.2f", product.price))
                        .bold()
                        .font(.subheadline)
                    Text("x \(quantity)")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing,60)
        
            
            Spacer()
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5), radius: 4)
        }
        .padding(.horizontal)
        .overlay{
            VStack(spacing: 25){
                Image(systemName: "trash.fill")
                    .foregroundStyle(.red.opacity(0.2))
                    .onTapGesture {
                        viewModel.removeProductFromCart(product: product)
                    }
                HStack(spacing: 20){
                    Button {
                        viewModel.incrementTheProductQuantity(product: product)
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    Button {
                        viewModel.decrementTheProductQuantity(product: product)
                    } label: {
                        Image(systemName: "minus")
                    }

                }
                 .tint(.gray)
                 .padding(5)
               //  .padding(.trailing, 20)
            }
            .position(x: 347,y: 50)
            
        }
    }
}

#Preview {
    CartProductView(viewModel: CartViewModel(), product: .sampleProduct, quantity: 2)
}
