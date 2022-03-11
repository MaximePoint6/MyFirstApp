//
//  HabitDescriptionView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 12/12/2021.
//

import SwiftUI

struct HabitDescriptionView: View {
    
    @ObservedObject var habitEntity : HabitEntity
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(habitEntity.stringDescription)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .padding(.bottom, 2.0)
                    
                Text("Total total : \(habitEntity.totalMinutesSpent()) min")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
    }
}

struct HabitDescriptionView_Previews: PreviewProvider {
    
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
        HabitDescriptionView(habitEntity: habitEntity)
            .previewLayout(.sizeThatFits)
    }
}
