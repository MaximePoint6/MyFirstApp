//
//  MyFirstAppApp.swift
//  MyFirstApp
//
//  Created by Maxime Point on 01/12/2021.
//

import SwiftUI

@main
struct MyFirstAppApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(HabitLibrary())
                . environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

