//
//  CustomImageLoader.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 03/12/24.
//

import SwiftUI

struct CustomAsyncImage: View {
    let url: URL
    let placeholder: () -> AnyView
    let errorView: () -> AnyView
    
    @State private var image: UIImage? = nil
    @State private var isError = false
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if isError {
                errorView()
            } else {
                placeholder()
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            } else {
                DispatchQueue.main.async {
                    self.isError = true
                }
            }
        }
        task.resume()
    }
}
