//
//  ExplorerCoreDataApp.swift
//  Shared
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI

@main
struct ExplorerCoreDataApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
