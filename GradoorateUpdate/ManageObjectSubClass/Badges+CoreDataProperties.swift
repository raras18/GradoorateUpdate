//
//  Badges+CoreDataProperties.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 15/08/23.
//
//

import Foundation
import CoreData


extension Badges {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Badges> {
        return NSFetchRequest<Badges>(entityName: "Badges")
    }

    @NSManaged public var badge: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var milestones: Milestones?

}

extension Badges : Identifiable {

}
