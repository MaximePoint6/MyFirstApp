//
//  HabitCreationView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 03/12/2021.
//

import SwiftUI

struct HabitCreationView: View {
    
    @ObservedObject var habitLibrary: HabitLibrary
    @State var habitConfig = NewHabitConfig ()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 16){
                    TextField("Habit name", text: $habitConfig.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextEditor(text: $habitConfig.Description)
                        .border(Color.gray, width: 1)
                        .frame(height: 150)
                    CoverSelectionView(selectedURL: $habitConfig.imageURL)
                }.padding()
            }.navigationTitle(Text("New Habit"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            let newHabit = HabitEntity(context: viewContext)
                            newHabit.id = UUID()
                            newHabit.name = habitConfig.name
                            newHabit.stringDescription = habitConfig.Description
                            newHabit.imageURL = habitConfig.imageURL
                            newHabit.isFavourite = false
                            
                            do {
                                try viewContext.save()
                            } catch {
                                print("Erreur lors de l'enregistrement")
                            }
                            
                            dismiss()
                            
                        }, label: {Text("Validate")})
                    }
                }
        }
    }
}

struct HabitCreationView_Previews: PreviewProvider {
    
    @StateObject static var habitLibrary = HabitLibrary()
    
    static var previews: some View {
        HabitCreationView(habitLibrary: habitLibrary)
    }
}
