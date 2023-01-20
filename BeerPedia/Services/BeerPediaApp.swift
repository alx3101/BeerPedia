//
//  BeerPediaApp.swift
//  BeerPedia
//
//  Created by alex popa on 17/01/23.
//

import SwiftUI

@main
struct BeerPediaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
