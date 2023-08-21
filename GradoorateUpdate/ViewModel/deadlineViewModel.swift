//
//  deadlineViewModel.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 18/08/23.
//

import Foundation
import SwiftUI
import CoreData

extension DeadlineView {
    @MainActor class ViewModel: ObservableObject {
        @Published var milestones = [Milestone](repeating: Milestone(date: Date()), count: 5)
        
        func saveData() {
            for milestone in milestones {
                let selectedDate = Milestones(context: persistanceController.shared.viewContext)
                selectedDate.id = UUID()
                selectedDate.deadline = milestone.date
                print(milestone.date)
            }
            persistanceController.shared.saveContext()
        }
    }
}
