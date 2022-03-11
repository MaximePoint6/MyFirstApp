//
//  Habit.swift
//  MyFirstApp
//
//  Created by Maxime Point on 02/12/2021.
//

import Foundation

class Habit : Identifiable, ObservableObject {
    
    let id=UUID().uuidString
    @Published var imageURL : URL?
    @Published var name : String
    @Published var isFavourite : Bool
    @Published var description: String
    @Published var timeSlot : [SpentTime]
    

    var totalTime :Int {
        var sum : Int = 0
        for time in timeSlot {
            sum += time.minutes
        }
        return sum
    }
    
    init (config : NewHabitConfig) {
        self.imageURL = config.imageURL
        self.name = config.name
        self.description = config.Description
        self.isFavourite = false
        self.timeSlot = []
    }
    
    init (imageURL: URL?, name: String, isFavourite: Bool, description: String) {
        self.imageURL = imageURL
        self.name = name
        self.isFavourite = isFavourite
        self.description = description
        self.timeSlot = []
    }
    
}
