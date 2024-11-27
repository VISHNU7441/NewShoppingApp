//
//  ProductDetailedView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 02/11/24.
//

import SwiftUI

struct ProductDetailedView: View {
    let product:Product
    var body: some View {
        ZStack{
            Color.white.opacity(0.3).ignoresSafeArea()
            
            VStack{
                TabView {
                    ForEach(1..<5){ _ in
                        AsyncImage(url: URL(string: product.image)){ result in
                            switch result {
                            case .empty:
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.yellow)
                                    .frame(width: 100, height: 100)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            case .failure(_):
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 100, height: 100)
                            @unknown default:
                                fatalError()
                            }
                            
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 300)
                
                Spacer()
                
                UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30, style: .continuous)
                    .fill(.gray.opacity(0.1))
                    .ignoresSafeArea()
                    .overlay {
                        // Build as sub view()
                        VStack(alignment:.leading){
                            Text(product.title)
                                .font(.title2)
                                .bold()
                                .padding(.bottom, 6)
                            HStack{
                                VStack{
                                    Text(String(format: "$%.2f", product.price))
                                        .bold()
                                    ratingView(product.rating.rate)
                                        .font(.subheadline)
                                }
                                Spacer()
                                
                                Text("Seller: Tariqul isalm")
                            }
                       
                            Text("Description")
                                .underline(true, color: Color.orange)
                            
                            ScrollView{
                                VStack{
                                    Text(product.description)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                        .padding()
                        .overlay(alignment:.bottom){
                            Button{
                                
                            }label:{
                                Text("Add to Cart")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background{
                                        Capsule()
                                            .fill(.orange.opacity(0.7))
                                    }
                            }
                        }
            
                    }
                    
                

                
                
            }
        }
    }
}

#Preview {
    ProductDetailedView(product: Product.sampleProduct)
}
