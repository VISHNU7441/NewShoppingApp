//
//  CartProductView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 29/11/24.
//

import SwiftUI

struct CartProductView: View {
    let product:Product
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: product.image)){ result in
                switch result {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure(_):
                    Rectangle()
                        .fill(.red)
                        
                @unknown default:
                    fatalError()
                }
                
            }
            .frame(width: 50, height: 50)
            .padding(.leading, 10)
            
            VStack(alignment:.leading, spacing: 5){
                Text(product.title)
                    .foregroundStyle(.primary)
                    .bold()
                    .lineLimit(1, reservesSpace: true)
                
                Text(product.category)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                
                Text(String(format: "$%0.2f", product.price))
                    .bold()
                    .font(.subheadline)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5), radius: 4)
        }
        .padding()
    }
}

#Preview {
    CartProductView(product: .sampleProduct)
}
