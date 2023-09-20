import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \NoteItem.id, ascending: true)], animation: .default)
    private var notes: FetchedResults<NoteItem>
    @State private var selectedNote: NoteItem? = nil

    
    func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            let noteItem = notes[index]
            viewContext.delete(noteItem)
        }
        
        do {
            try viewContext.save()
        } catch {
            // Handle save error
            print("Failed to save context: \(error)")
        }
    }
    
    var body: some View {
        NavigationView {
             VStack {
                List {
                    ForEach(notes, id:\.id) { item in
                        if let notename = item.notename, let notecontent = item.notecontent {
                            NavigationLink(destination: NoteContentDetailView(notename: notename, notecontent: notecontent)) {
                                Text(notename)
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteNotes(at: indexSet)
                    })
                }
                
                
                NavigationLink(destination: NoteEditView()) {
                    Image(systemName: "plus.app").frame(width: 30, height: 30)
                }
                
            }
            .navigationTitle("title")
        }
    }
}


#Preview {
    NotePreview(contextWith: \.items) {
        ContentView()
    }
}





