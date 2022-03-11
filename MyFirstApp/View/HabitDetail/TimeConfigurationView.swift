//
//  TimeConfigurationView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 13/12/2021.
//

import SwiftUI

struct TimeConfigurationView: View {
    
    @Binding var selectedMinutes : Int
    @Binding var selectedDates : Date
    
    var body: some View {
        
        VStack {
            
            Picker ("Temps consacré", selection: $selectedMinutes) {
                ForEach (0..<120) {
                    Text("\($0)")
                        .rotationEffect(Angle.degrees(90))
                }
            }.pickerStyle(.wheel)
                .rotationEffect(Angle.degrees(-90))
                .frame(maxHeight: 50)
                .clipped()
            
            DatePicker (
                "Choisir une date",
                selection: $selectedDates,
                in: ...Date(),
                displayedComponents: .date
            )
        }
    }
}

struct TimeConfigurationView_Previews: PreviewProvider {
    
    @State static var selectedMinutes = 30
    @State static var selectedDates = Date()
    
    static var previews: some View {
        TimeConfigurationView(selectedMinutes: $selectedMinutes, selectedDates: $selectedDates)
            .padding(10.0)
            .previewLayout(.sizeThatFits)
        
    }
}
