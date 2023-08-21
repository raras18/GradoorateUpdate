//
//  Logs+CoreDataProperties.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 15/08/23.
//
//

import Foundation
import CoreData


extension Logs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Logs> {
        return NSFetchRequest<Logs>(entityName: "Logs")
    }

    @NSManaged public var badge: Bool
    @NSManaged public var dateNow: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var feeling: Int16
    @NSManaged public var nextPlan: String?
    @NSManaged public var significant: Bool
    @NSManaged public var todayLog: String?
    @NSManaged public var milestones: Milestones?

}

extension Logs : Identifiable {

}
