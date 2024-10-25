//
//  ProductCardView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct ProductCardView: View {
    @State var isFavourite:Bool = false
    var product:Product
    var body: some View {
        ZStack{
            
            AsyncImage(url: URL(string: product.image)){ result in
                switch result {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                case .failure(_):
                    ProgressView()
                @unknown default:
                    fatalError()
                }
                
            }
            .position(x: 80, y: 90)
            
            VStack{
                Spacer().frame(height: 160)
                Text(product.title)
                    .font(.headline)
                    .padding(.bottom, 8)
                
                HStack(spacing: 20){
                    Text("$" + String(format: "%.2f", product.price))
                        .font(.system(size: 20, weight: .bold))
                        
                    
                    ratingView(product.rating.rate)
                    
                }
                
            }
                
        }
        .frame(width: 170, height: 300)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .gray.opacity(0.6), radius: 10)
        .overlay(alignment:.topTrailing) {
            Image(systemName: "heart.fill")
                .foregroundStyle(isFavourite ? .red : .white)
                .padding()
                .background(.orange)
                .clipShape(
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii( bottomLeading: 15,topTrailing: 15)))  // unevenRoundedRectangle
                .onTapGesture {
                    isFavourite.toggle()
                }
        }
    }
}


#Preview {
    ProductCardView(product: Product.sampleProduct)
}
