//
//  HabitCellView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 01/12/2021.
//

import SwiftUI
import Kingfisher

struct HabitCellView: View {
    
    @ObservedObject var habitEntity : HabitEntity
    
    var body: some View {
        VStack {
            HStack {
                KFImage(habitEntity.imageURL)
                    .resizable()
                    . aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.trailing ,8)
                VStack (alignment: .leading) {
                    Text(habitEntity.name)
                        .font(.system(.title2))
                        .fontWeight(.semibold)
                    Text("Total : \(habitEntity.totalMinutesSpent()) min")
                        .fontWeight(.light)
                }
                Spacer()
                FavouriteButtonView(onColor: Color.red, offColor : Color.gray, isLiked: $habitEntity.isFavourite)
            }.padding(8)
        }
    }
}

struct HabitCellView_Previews: PreviewProvider {
    
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
        HabitCellView(habitEntity: habitEntity)
            .previewLayout(.sizeThatFits)
    }
}
