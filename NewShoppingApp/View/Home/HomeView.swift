//
//  HomeView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct HomeView: View {
   
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                // SearchBar
                HStack{
                    TextField("Search...", text: $viewModel.searchTerm)
                        .onChange(of: viewModel.searchTerm) { _ , newValue in
                            if newValue.count > 3 {
                                
                            }
                        }
                    
                    Image(systemName: "sparkle.magnifyingglass")
                    
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.2))
                    
                }
                .padding(.horizontal, 5)
       
    // MARK: Main content
                
                ScrollView{
                    VStack{
                    // BannerView()
                        
                        BannerView()
                            .padding(.bottom, 5)
                        
                    // For making categoryView sticky
                        
                        GeometryReader{ geo in
                            let yOffset = geo.frame(in: .global).minY
                            VStack{
                                CategoryView(viewModel: viewModel)
                                
                                HStack{
                                    Text("Special For You")
                                        .font(.title2)
                                        .bold()
                                        .padding(.bottom, 7)
                                    
                                    Spacer()
                                    
                                    Text("See all ")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                }
                                .padding(.horizontal, 15)
                            }
                            .background(.white)
                            .offset(y: max((158 - yOffset), 0))
                            
                        }
                        .frame(height: 150)
                        .zIndex(3)                // Align the header view to top
                        
                    // Product List view
                        
                        LazyVGrid(columns:[GridItem(spacing:0), GridItem()]){
                            ForEach(viewModel.listOfProducts){ product in
                                NavigationLink(value: product) {
                                    ProductCardView(product: product)
                                }
                                .buttonStyle(PlainButtonStyle())
                               
                            }
                        }
                        .padding(.horizontal, 5)
                        .navigationDestination(for: Product.self) { product in
                            ProductDetailedView(product: product, homeViewModel: viewModel)
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Text("Super market")
                        .bold()
                        .font(.title)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "bell")
                        .padding(6)
                        .background{
                            Circle()
                                .fill(.gray.opacity(0.2))
                        }
                }
                
                
            }
            
            
        }
        .task {
           await viewModel.fetchData()
        }
    }
}

#Preview {
    HomeView()
}
