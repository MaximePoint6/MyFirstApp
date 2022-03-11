//
//  FavouriteButtonView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 01/12/2021.
//

import SwiftUI

struct FavouriteButtonView: View {
    
    let onColor : Color
    let offColor : Color
    
    @Binding var isLiked: Bool
    
    var body: some View {
        
        Button (action : {
            isLiked.toggle()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .foregroundColor(isLiked ? onColor : offColor)
        })
        
    }
}

struct FavouriteButtonView_Previews: PreviewProvider {
    
    @State static var isLiked : Bool = true
    @State static var isNotLiked : Bool = false
    
    static var previews: some View {
        Group {
            FavouriteButtonView(onColor: Color.red, offColor : Color.gray, isLiked: $isLiked)
                .previewLayout(.sizeThatFits)
            FavouriteButtonView(onColor: Color.red, offColor : Color.gray, isLiked: $isNotLiked)
                .previewLayout(.sizeThatFits)
        }
    }
}
