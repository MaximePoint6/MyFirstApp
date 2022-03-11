//
//  SpentTime.swift
//  MyFirstApp
//
//  Created by Maxime Point on 13/12/2021.
//

import Foundation

struct SpentTime : Identifiable {
    
    let id = UUID().uuidString
    let date : Date
    let minutes : Int
    
}
