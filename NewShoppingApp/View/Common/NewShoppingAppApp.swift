//
//  NewShoppingAppApp.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI

@main
struct NewShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/*
 - NewShoppingApp
   - Model
     - Product.swift
     - CategoryType.swift
   - View
     - Cart
       - CartView.swift
       - CartProductCardView.swift
     - Product
       - ProductDetailedView.swift
       - ProductCardView.swift
     - Category
       - CategoryView.swift
     - Common
       - BannerView.swift
       - Reusable Components (if not specific to a feature)
   - ViewModel
     - CartViewModel.swift
     - HomeViewModel.swift
   - Services (optional)
     - NetworkService.swift
     - APIEndpoints.swift
     - NetworkErrorType.swift
   - Others
     - Download.JSON
     - MockData.swift (if used for testing)
   - Preview Content
     - Mock Data for SwiftUI Previews
 */
