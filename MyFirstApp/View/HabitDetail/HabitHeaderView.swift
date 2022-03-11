//
//  HabitHeaderView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 12/12/2021.
//

import SwiftUI
import Kingfisher

struct HabitHeaderView: View {
    
    @ObservedObject var habitEntity : HabitEntity
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                KFImage(habitEntity.imageURL)
                    .resizable()
                    . aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.5), .clear]),
                    startPoint: .bottom,
                    endPoint: .top)
                    .frame(height:100)
                HStack {
                    Text(habitEntity.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                    FavouriteButtonView(onColor: Color.red, offColor : Color.white, isLiked: $habitEntity.isFavourite)
                }.padding()
            }
        }
    }
}

struct HabitHeaderView_Previews: PreviewProvider {

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
        HabitHeaderView(habitEntity: habitEntity)
    }
}
