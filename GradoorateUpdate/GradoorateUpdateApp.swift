//
//  GradoorateUpdateApp.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 14/08/23.
//

import SwiftUI

@main
struct GradoorateUpdateApp: App {
    @Environment(\.scenePhase) var scenePhase
    let PersistenceController = persistanceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            PersistenceController.saveContext()
        }
    }
}
