//
//  Data.swift
//  MyFirstApp
//
//  Created by Maxime Point on 02/12/2021.
//

import Foundation

class HabitLibrary : ObservableObject {

    @Published var testHabits = [
        Habit(imageURL: URL(string : "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), name: "Running", isFavourite: false, description: "Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi."),
        Habit(imageURL: URL(string : "https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"), name: "Coding", isFavourite: true, description: "Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi."),
        Habit(imageURL: URL (string: "https://images.pexels.com/photos/922100/pexels-photo-922100.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), name: "Reading", isFavourite: false, description: "Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi.")
    ]
}

let listOfURLs = [
    URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/936094/pexels-photo-936094.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/374147/pexels-photo-374147.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/373941/pexels-photo-373941.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/3060324/pexels-photo-3060324.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/3760529/pexels-photo-3760529.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/4974915/pexels-photo-4974915.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/1436618/pexels-photo-1436618.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/2147042/pexels-photo-2147042.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/374074/pexels-photo-374074.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/810775/pexels-photo-810775.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/786003/pexels-photo-786003.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/160107/pexels-photo-160107.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
]

