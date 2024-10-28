//
//  HomeView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

struct HomeView: View {
    @State var searchTerm:String = ""
    var body: some View {
        NavigationStack{
            VStack{
                // SearchBar
                HStack{
                    TextField("Search...", text: $searchTerm)
                    
                    Image(systemName: "sparkle.magnifyingglass")
                       
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.2))
                        
                }
                .padding(.horizontal, 10)
                
                // BannerView()
                BannerView()
                    .padding(.bottom, 10)
                
            
                CategoryView()
                
                Spacer()
                
                
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
    }
}

#Preview {
    HomeView()
}
