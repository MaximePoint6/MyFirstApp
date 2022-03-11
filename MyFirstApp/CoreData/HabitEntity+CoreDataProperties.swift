//
//  HabitEntity+CoreDataProperties.swift
//  MyFirstApp
//
//  Created by Maxime Point on 24/12/2021.
//
//

import Foundation
import CoreData


extension HabitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitEntity> {
        return NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var imageURL: URL?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var name: String
    @NSManaged public var stringDescription: String
    @NSManaged public var timeSlots: NSSet?
    
    func totalMinutesSpent () -> Int {
        guard let timeSlots = timeSlots else { return 0 }
        guard let values = Array(timeSlots) as? [SpentTimeEntity] else { return 0 }
        return values.map { Int($0.minutes) }.reduce (0, +)
    }
     
    func spentTime() -> [SpentTimeEntity] {
        if let timeSlots = timeSlots {
            return  Array(timeSlots) as! [SpentTimeEntity]
        } else {
            return [SpentTimeEntity]()
        }
    }
    
}

// MARK: Generated accessors for timeSlots
extension HabitEntity {

    @objc(addTimeSlotsObject:)
    @NSManaged public func addToTimeSlots(_ value: SpentTimeEntity)

    @objc(removeTimeSlotsObject:)
    @NSManaged public func removeFromTimeSlots(_ value: SpentTimeEntity)

    @objc(addTimeSlots:)
    @NSManaged public func addToTimeSlots(_ values: NSSet)

    @objc(removeTimeSlots:)
    @NSManaged public func removeFromTimeSlots(_ values: NSSet)

}

extension HabitEntity : Identifiable {

}

