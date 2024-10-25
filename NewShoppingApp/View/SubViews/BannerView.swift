//
//  BannerView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        TabView {
            ForEach(1..<5){ index in
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue)
                    .padding(.horizontal)
                    .overlay{
                        VStack(alignment: .leading) {
                            Text("Super Sale Discount")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Up to 50%")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            Button(action: {
                                // Action for Shop Now
                            }) {
                                Text("Shop Now")
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .position(x: 120, y: 120)
                    }
            }
        
        }
        .frame(height: 250)
        .tabViewStyle(.page(indexDisplayMode:.automatic))
    }
}

#Preview {
    BannerView()
}
