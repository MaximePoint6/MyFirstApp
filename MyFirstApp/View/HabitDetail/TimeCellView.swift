//
//  TimeCellView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 12/12/2021.
//

import SwiftUI

struct TimeCellView: View {
    
    let spentTime : SpentTimeEntity
    
    var body: some View {
        HStack {
            Text("Total : \(spentTime.minutes) min")
                .fontWeight(.semibold)
            Spacer()
            Text(stringDate(date : spentTime.date))
        }
    }

    private func stringDate (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
}

struct TimeCellView_Previews: PreviewProvider {
    
    static private let persistentController = PersistenceController.preview
    static private let time : SpentTimeEntity = {
        let  timeEntity = SpentTimeEntity(context: persistentController.container.viewContext)
        timeEntity.id = UUID()
        timeEntity.minutes = 36
        timeEntity.date = Date()
        return timeEntity
    }()
    
    static var previews: some View {
        TimeCellView(spentTime: time)
            .padding(10.0)
            .previewLayout(.sizeThatFits)
    }
}
