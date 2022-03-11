//
//  HabitDetailView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 12/12/2021.
//

import SwiftUI

struct HabitDetailView: View {
    
    @EnvironmentObject var habitLibrary : HabitLibrary
    @ObservedObject var habitEntity : HabitEntity
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedDates = Date()
    @State private var selectedMinutes = 30
    @State private var displayTimeConfiguration : Bool = false
    
    var body: some View {
        VStack {
            HabitHeaderView(habitEntity: habitEntity)
            
            HabitDescriptionView(habitEntity: habitEntity )
                .padding()
             
            if displayTimeConfiguration == true {
                TimeConfigurationView(selectedMinutes: $selectedMinutes, selectedDates: $selectedDates)
            }
            
            StandardButtonView  (
                _action : {
                    withAnimation{
                        displayTimeConfiguration ? AddNewTime() : displayTimeConfiguration.toggle()
                    }
                },
                color : displayTimeConfiguration ? .green : .blue,
                title : displayTimeConfiguration ? "Valider" : "Ajouter un temps")
                .padding()
            
            
            ScrollView {
                ForEach(habitEntity.spentTime()) { time in
                    TimeCellView(spentTime: time)
                        .padding()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                }
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewContext.delete(habitEntity)
                        do {
                            try viewContext.save()
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                            
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.black)
                    }  
                }
            }
        }
    }
    
    private func AddNewTime () {
        
        habitLibrary.objectWillChange.send()

        let newTimeSlot = SpentTimeEntity(context: viewContext)
        newTimeSlot.id = UUID()
        newTimeSlot.minutes = Int64(selectedMinutes)
        newTimeSlot.date = selectedDates
        habitEntity.addToTimeSlots(newTimeSlot)
        
        do {
            try viewContext.save()
        } catch {
           print ("Erreur lors de l'enregistrement")
        }
        
        displayTimeConfiguration.toggle()
    }
    
}



struct HabitDetailView_Previews: PreviewProvider {
    
    
    static private let persistentController = PersistenceController.preview
    static private let habitEntity : HabitEntity = {
        let  habitEntity = HabitEntity(context: persistentController.container.viewContext)
        habitEntity.id = UUID()
        habitEntity.isFavourite = true
        habitEntity.name = "Habitude test"
        habitEntity.stringDescription = "Description test"
        habitEntity.imageURL = URL(string : "https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
        return habitEntity
    }()
    
    static var previews: some View {
        NavigationView {
            HabitDetailView(habitEntity: habitEntity)
        }
    }
}
