//
//  CoverSelectionView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 06/12/2021.
//

import SwiftUI
import Kingfisher

struct CoverSelectionView: View {
    
    @Binding var selectedURL:URL?
    
    private let layout = [
        GridItem(.flexible(), spacing: 2, alignment: .center),
        GridItem(.flexible(), spacing: 2, alignment: .center),
    ]
    
    private let urls = listOfURLs
    let pictureSize = (UIScreen.main.bounds.width - 4) / 2
    
    
    var body: some View {
        
        LazyVGrid(columns : layout, spacing: 2){
            ForEach(urls, id : \.self) { url in
                ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    KFImage (url)
                        .resizable()
                        . aspectRatio(contentMode: .fill)
                        .frame(width: pictureSize, height: pictureSize)
                        .clipped()
                        .onTapGesture(perform: {
                            selectedURL = url
                        })
                    if url == selectedURL {
                        Rectangle()
                        .foregroundColor(.clear)
                        .border(Color.blue, width: 3)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 30))
                            .padding(8)
                    }
                }
            }
        }
        
    }
}

struct CoverSelectionView_Previews: PreviewProvider {
    
    @State static var selectedURL:URL? = nil
    
    static var previews: some View {
        CoverSelectionView(selectedURL: $selectedURL)
.previewInterfaceOrientation(.portrait)
    }
}
