//
//  MainTabView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 19/12/2021.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var habitLibrary : HabitLibrary
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "rectangle.grid.1x2") }
            StatisticsView()
                .tabItem { Image(systemName: "chart.bar.fill") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainTabView()
            .environmentObject(HabitLibrary())

    }
}
