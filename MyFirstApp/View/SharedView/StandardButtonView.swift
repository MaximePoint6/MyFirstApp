//
//  AddTimeButton.swift
//  MyFirstApp
//
//  Created by Maxime Point on 14/12/2021.
//

import SwiftUI

struct StandardButtonView: View {
    
    let _action : () -> Void
    let color : Color
    let title : String
    
    var body: some View {
        Button  (action : _action ,
                 label: {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }) .background(color)
            .cornerRadius(10)
            .shadow(radius: 3)
    }
}

struct AddTimeButton_Previews: PreviewProvider {
    
    static var previews: some View {
        StandardButtonView(_action: {}, color: .blue, title: "test")
            .padding(10.0)
            .previewLayout(.sizeThatFits)
    }
}
