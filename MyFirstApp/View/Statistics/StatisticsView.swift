//
//  StatisticsView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 22/12/2021.
//

import SwiftUI

struct StatisticsView: View {
    
    @FetchRequest(entity: HabitEntity.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]
    ) var habits: FetchedResults<HabitEntity>
    
    var body: some View {
        VStack {
            RankingView()
                .padding()
            ScrollView {
                ForEach(habits) { _habitEntity in
                    VStack (alignment: .leading, spacing: 30){
                        Text(_habitEntity.name)
                            .font(.title)
                            .fontWeight(.bold)
                        StatisticsHabitView(habitEntity: _habitEntity)
                            .frame(minHeight: 200)
                    }.padding()
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    
    static var previews: some View {
        StatisticsView()
    }
}
