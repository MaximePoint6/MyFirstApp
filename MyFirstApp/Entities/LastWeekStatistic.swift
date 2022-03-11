//
//  LastWeekStatistic.swift
//  MyFirstApp
//
//  Created by Maxime Point on 22/12/2021.
//

import Foundation

struct LastWeekStatistic : Identifiable {
    
    let id = UUID().uuidString
    let date : Date
    let minutes : Int
    
}

