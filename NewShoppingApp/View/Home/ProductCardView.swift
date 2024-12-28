//
//  ProductCardView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct ProductCardView: View {
    @ObservedObject var homeViewModel:HomeViewModel
    @State var isFavourite:Bool = false
    var product:Product
    var body: some View {
        ZStack{
            
            AsyncImage(url: URL(string: product.image)){ result in
                switch result {
                case .empty:
                    RoundedRectangle(cornerRadius: 20)
                         .fill(.gray.opacity(0.4))
                         .frame(width: 150, height: 150)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                case .failure(_):
                    RoundedRectangle(cornerRadius: 20)
                         .fill(.gray.opacity(0.4))
                         .frame(width: 150, height: 150)
                @unknown default:
                    fatalError()
                }
                
            }
            .position(x: 80, y: 90)
            
            // product content
            
            VStack{
                Spacer().frame(height: 160)
                Text(product.title)
                    .font(.subheadline)
                    .padding(.bottom, 8)
                
                HStack(spacing: 20){
                    Text("$" + String(format: "%.2f", product.price))
                        .font(.system(size: 16, weight: .bold))
                        
                    ratingView(product.rating.rate)
                    
                }
                
            }
                
        }
        .frame(width: 150, height: 250)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .gray.opacity(0.3), radius: 5)
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
        .onChange(of: isFavourite) {
            if isFavourite{
                homeViewModel.addProductToWishList(product: product)
            }
            else{
                homeViewModel.deleteProductFromWishList(product: product)
            }
        }
    }
}


#Preview {
    ProductCardView(homeViewModel: HomeViewModel(), product: Product.sampleProduct)
}
