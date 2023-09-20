//
//  NotePreview.swift
//  iosdev
//
//  Created by kai cooper on 9/17/23.
//

import CoreData
import SwiftUI

struct NotePreview<Content: View, Model>: View {
    var content: Content
    var persistence: NoteController

    /// Initializer that provides the instance of `model`
    init(_ keyPath: KeyPath<NotePreviewData, (NSManagedObjectContext) -> Model>, @ViewBuilder content: (Model) -> Content) {

        self.persistence = NoteController(inMemory: true)
        let data = NotePreviewData()
        let closure = data[keyPath: keyPath]
        let models = closure(persistence.container.viewContext)

        self.content = content(models)
    }

    /// Initializer that provides a context with an instance of `model`
    init(contextWith keyPath: KeyPath<NotePreviewData, (NSManagedObjectContext) -> Model>, @ViewBuilder content: () -> Content) {

        self.persistence = NoteController(inMemory: true)
        let data = NotePreviewData()
        let closure = data[keyPath: keyPath]

        // Ignore closure return, we just care about creating the data
        _ = closure(persistence.container.viewContext)

        self.content = content()
    }

    var body: some View {
        content
            .environment(\.managedObjectContext, persistence.container.viewContext)
    }
}

struct NotePreviewData {
    var items: (NSManagedObjectContext) -> [NoteItem] { { context in
        var createdItems = [NoteItem]()
        for _ in 0..<15 {
            let newItem = NoteItem(context: context)
            newItem.id = UUID()
            newItem.notename = "testpreview"
            newItem.notecontent = "testpreviewcontent"
            createdItems.append(newItem)
        }
        return createdItems
    } }

    var item: (NSManagedObjectContext) -> NoteItem { { context in
        let newItem = NoteItem(context: context)
        newItem.id = UUID()
        newItem.notename = "testpreview"
        newItem.notecontent = "testpreviewcontent"
        return newItem
    } }
}
