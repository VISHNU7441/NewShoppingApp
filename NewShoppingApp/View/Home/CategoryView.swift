//
//  CategoryView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct CategoryView: View {
    
   private let listOfCategory:[CategoryItem] = [
    CategoryItem(title: "all", image: "all category", categoryType: .all),
    CategoryItem(title: "electronics", image: "electronics", categoryType: .electronics),
    CategoryItem(title: "jewellery", image: "jewelery", categoryType: .jewellery),
    CategoryItem(title: "Men's Clothing", image: "men's clothing", categoryType: .mensClothing),
    CategoryItem(title: "Women's clothing", image: "women's clothing", categoryType: .womensClothing)
    ]
    
    @ObservedObject var viewModel:HomeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                    ForEach(listOfCategory){ item in
                        Button{
                            viewModel.setListOfProducts(category: item.categoryType)
                        } label: {
                            VStack{
                                Image("Category/\(item.image)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                
                                Text(item.title.capitalized)
                                    .font(.footnote)
                                    .frame(minWidth: 50, maxWidth: 70)
                                    .lineLimit(2, reservesSpace: true)
                                    .multilineTextAlignment(.center)
                                    
                            }
                        }
                        .tint(.black)
                    }
                }
            }
        .padding(.top, 10)
        }
    }

#Preview {
   CategoryView(viewModel: HomeViewModel())
}
