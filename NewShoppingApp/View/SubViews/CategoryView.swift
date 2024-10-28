//
//  CategoryView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                    ForEach(Category.allCases, id: \.hashValue){ category in
                        VStack{
                            Image("Category/\(category.rawValue)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            
                            Text(category.rawValue.capitalized)
                                .font(.footnote)
                                .frame(minWidth: 50, maxWidth: 70)
                                .lineLimit(2, reservesSpace: true)
                                .multilineTextAlignment(.center)
                                
                        }
                    }
                }
            }
        }
    }

#Preview {
    CategoryView()
}
