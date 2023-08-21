//
//  Milestones+CoreDataProperties.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 15/08/23.
//
//

import Foundation
import CoreData


extension Milestones {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Milestones> {
        return NSFetchRequest<Milestones>(entityName: "Milestones")
    }

    @NSManaged public var deadline: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var logs: Set<Logs>?
    @NSManaged public var badges: Set<Badges>?
    
    public var logArray: [Logs] {
        let logSet = logs
        
        return logSet!.sorted {
            $0.id > $1.id
        }
    }
    
    public var badgeArray: [Badges] {
        let badgeSet = badges
        
        return badgeSet!.sorted {
            $0.id > $1.id
        }
    }

}

// MARK: Generated accessors for logs
extension Milestones {

    @objc(addLogsObject:)
    @NSManaged public func addToLogs(_ value: Logs)

    @objc(removeLogsObject:)
    @NSManaged public func removeFromLogs(_ value: Logs)

    @objc(addLogs:)
    @NSManaged public func addToLogs(_ values: NSSet)

    @objc(removeLogs:)
    @NSManaged public func removeFromLogs(_ values: NSSet)

}

// MARK: Generated accessors for badges
extension Milestones {

    @objc(addBadgesObject:)
    @NSManaged public func addToBadges(_ value: Badges)

    @objc(removeBadgesObject:)
    @NSManaged public func removeFromBadges(_ value: Badges)

    @objc(addBadges:)
    @NSManaged public func addToBadges(_ values: NSSet)

    @objc(removeBadges:)
    @NSManaged public func removeFromBadges(_ values: NSSet)

}

extension Milestones : Identifiable {

}
