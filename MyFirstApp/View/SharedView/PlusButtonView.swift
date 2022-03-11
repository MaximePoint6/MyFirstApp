//
//  PlusButtonView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 02/12/2021.
//

import SwiftUI

struct PlusButtonView: View {
    
    let _action : () -> Void
    
    var body: some View {
        
        Button  (action : _action, label: {
            ZStack {
                Circle ()
                    . foregroundColor(.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .light))
            }.shadow(radius: 10)
        })
    }
}

struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView(_action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
