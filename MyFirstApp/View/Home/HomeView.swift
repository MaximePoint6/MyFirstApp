//
//  HomeView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 01/12/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var habitLibrary : HabitLibrary
    @State private var isShowingHabitCreation : Bool = false
    @State private var favouriteOnly : Bool = false
    
    @FetchRequest(
        entity: HabitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]
    ) var habits: FetchedResults<HabitEntity>
    
    
    var body: some View {

        NavigationView {
            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                ScrollView {
                    VStack (spacing : 10) {
                        Rectangle()
                            .frame(height: 10)
                            .foregroundColor(.clear)
                        
                        
                        ForEach(habits) { _habitEntity in
                            if _habitEntity.isFavourite || !favouriteOnly {
                                ZStack {
                                    RoundedRectangle (cornerRadius: 16, style: .continuous)
                                        . fill(.white)
                                        . shadow(color: Color(Color.RGBColorSpace.sRGB, white: 0, opacity: 0.2), radius: 4)
                                    NavigationLink  {
                                        HabitDetailView(habitEntity: _habitEntity)
                                    } label: {
                                        HabitCellView(habitEntity: _habitEntity)
                                            .foregroundColor(.black)
                                    }
                                }
                                
                            }
                        }
                    }.padding(.horizontal,16)
                        .animation(Animation.easeInOut(duration: 0.5), value: favouriteOnly)
                }
                Spacer()
                HStack {
                    Spacer()
                    PlusButtonView(_action: {
                        isShowingHabitCreation.toggle()
                    }).sheet(isPresented: $isShowingHabitCreation, content: {HabitCreationView(habitLibrary: habitLibrary)})
                        .padding()
                    
                }
                
            }.navigationTitle(Text("My Habits"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            favouriteOnly.toggle()
                        } label: {
                            FavouriteButtonView(onColor: .red, offColor: .gray, isLiked: $favouriteOnly)
                        }
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .environmentObject(HabitLibrary())
    }
}
