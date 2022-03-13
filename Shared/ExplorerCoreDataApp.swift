//
//  ExplorerCoreDataApp.swift
//  Shared
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI

@main
struct ExplorerCoreDataApp: App {
    @StateObject private var imageModelData = ImageModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imageModelData)
        }
    }
}
