//
//  StatisticsHabitView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 19/12/2021.
//

import SwiftUI



struct StatisticsHabitView: View {
    
    @ObservedObject var habitEntity : HabitEntity
    
    var body: some View {
        
        HStack {
            ForEach (lastWeekCalendar(), id: \.self) { day in
                VStack {
                    Spacer()
                    RoundedRectangle (cornerRadius: 5, style: .continuous)
                        . foregroundColor(.blue)
                        .frame(width : 30, height: max(CGFloat(lastWeekStatistic()[day]!), 10), alignment: .center)
                        .cornerRadius(5)
                    RoundedRectangle (cornerRadius: 16, style: .continuous)
                        . foregroundColor(.clear)
                        . frame(height: 0.5)
                    Text(day)
                }
            }
        }
    }

    private func lastWeekCalendar () -> [String] {
        
        var lastWeekCalendar = [String]()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for index in 0..<7 {
            let newDay = calendar.date(byAdding: .day, value: -index, to: Date())!
            lastWeekCalendar.append(formatter.string(from: newDay))
        }
        return lastWeekCalendar.reversed()
    }
    
    
    private func lastWeekSlots () -> [SpentTimeEntity] {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        var lastWeekSlots = [SpentTimeEntity]()
        guard let timeSlots = habitEntity.timeSlots else  { return [] }
        for slot in Array(timeSlots) as! [SpentTimeEntity] {
            if slot.date > weekAgo {
                lastWeekSlots.append(slot)
            }
        }
        return lastWeekSlots
    }
    

    private func lastWeekStatistic() -> [String : Int] {
        var statistics = [String : Int]()
        let slots = lastWeekSlots()
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for day in lastWeekCalendar() {
            statistics[day] = 0
            
            for slot in slots {
                if day == formatter.string(from: slot.date) {
                    statistics[day]! += Int(slot.minutes)
                }
            }
            
        }
        return statistics
    }
}

struct StatisticsHabitView_Previews: PreviewProvider {
    
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
        StatisticsHabitView(habitEntity: habitEntity)
            .previewLayout(.sizeThatFits)
    }
}
