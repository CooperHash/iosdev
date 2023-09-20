//
//  iosdevApp.swift
//  iosdev
//
//  Created by kai cooper on 9/13/23.
//

import SwiftUI

@main
struct iosdevApp: App {
    private var noteController = NoteController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, noteController.container.viewContext)
        }
    }
}



