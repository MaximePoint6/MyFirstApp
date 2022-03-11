//
//  RankingView.swift
//  MyFirstApp
//
//  Created by Maxime Point on 22/12/2021.
//

import SwiftUI

struct RankingView: View {
    
    @FetchRequest(entity: HabitEntity.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]
    ) var habits: FetchedResults<HabitEntity>
    
    var body: some View {
        HStack (alignment: .bottom) {
            let habits = rankedHabits()
            if habits.count == 1 {
                PodiumStepView(habit: habits[0], rank: Rank(rawValue: 1)!)
            } else if habits.count == 2 {
                PodiumStepView(habit: habits[1], rank: Rank(rawValue: 2)!)
                PodiumStepView(habit: habits[0], rank: Rank(rawValue: 1)!)
            } else if habits.count == 3 {
                PodiumStepView(habit: habits[1], rank: Rank(rawValue: 2)!)
                PodiumStepView(habit: habits[0], rank: Rank(rawValue: 1)!)
                PodiumStepView(habit: habits[2], rank: Rank(rawValue: 3)!)
            }
        }
    }
    
    
    private func rankedHabits  () -> [HabitEntity] {
        let sortedHabits = habits.sorted { habit1, habit2 in
            return habit1.totalMinutesSpent() > habit2.totalMinutesSpent()
        }
        let numbersHabits = sortedHabits.count >= 3 ? 3 : sortedHabits.count
        return Array(sortedHabits.prefix(upTo: numbersHabits))
    }
}


private struct PodiumStepView: View {
    
    @ObservedObject var habit : HabitEntity
    let rank : Rank
    
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.system(size : 18))
                .fontWeight(.semibold)
            Text("\(habit.totalMinutesSpent()) min")
                .font(.footnote)
                .fontWeight(.light)
            ZStack {
                RoundedRectangle (cornerRadius: 5, style: .continuous)
                    .foregroundColor(Color(white: 0.9))
                    .frame(height: 30 + CGFloat((3 - rank.rawValue) * 20))
                    .cornerRadius(5)
                switch rank {
                case .first :
                    Text("🥇")
                case .second :
                    Text("🥈")
                case .third :
                    Text("🥉")
                }
            }.font(.system(size: 28))
        }
    }
}



private enum Rank : Int {
    case first = 1
    case second = 2
    case third = 3
}





struct RankingView_Previews: PreviewProvider {

    static var previews: some View {
        RankingView()
    }
}
