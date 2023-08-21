//
//  persistanceController.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 15/08/23.
//

import Foundation
import CoreData
import SwiftUI

struct persistanceController{
    let container: NSPersistentContainer
    
    static let shared = persistanceController()

    //MARK: Convenience
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    static var preview: persistanceController = {
        let result = persistanceController(inMemory: true)
        let viewContext = result.container.viewContext
        let newMilestone = Milestones(context: viewContext)

        shared.saveContext()
        
        return result
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "dataModel") // else UnsafeRawBufferPointer with negative count
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    //MARK: SAVE DATA
    func saveContext() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: RESET DATA
    func resetData() {
        // Implement the data reset logic here
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Milestones.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
            print("Reset")
        } catch {
            print("Failed to reset Core Data: \(error)")
        }
    }
}
