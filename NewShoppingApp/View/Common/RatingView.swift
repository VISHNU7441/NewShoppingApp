//
//  RatingView.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 17/10/24.
//

import SwiftUI


func ratingView(_ value:Double) -> some View{
    Label(String(format: "%.1f", value), systemImage: "star.fill")
        .padding(2)
        .padding(.trailing, 5)
        .background(.orange)
        .clipShape(Capsule())
}
