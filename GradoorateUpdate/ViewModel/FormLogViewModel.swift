//
//  FormLogViewModel.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 21/08/23.
//

import Foundation
import SwiftUI

extension FormLogView {
    @MainActor class ViewModel: ObservableObject {
        @Published var todaysLog: String = ""
        @Published var nextPlan: String = ""
        @Published var valueSign: Bool?
        @Published var feeling: Int = 0

        //MARK: Function Add Logs
        func addLog(creates: Milestones){
            let newLog = Logs(context: persistanceController.shared.viewContext)
            newLog.id = UUID()
            newLog.todayLog = todaysLog
            newLog.nextPlan = nextPlan
            newLog.significant = valueSign ?? false
            newLog.feeling = Int16(feeling)
            newLog.dateNow = Date()
            creates.addToLogs(newLog)
            persistanceController.shared.saveContext()
        }
    }
}
