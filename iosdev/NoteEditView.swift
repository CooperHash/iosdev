//
//  NoteEditView.swift
//  iosdev
//
//  Created by kai cooper on 9/16/23.
//

import SwiftUI
import MarkdownUI

struct NoteEditView: View {
    @Environment(\.managedObjectContext) var _moc
    @Environment(\.presentationMode) var presentationMode
    
    @FocusState private var isNoteFocused: Bool
    
    @State private var text: String = ""
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                HStack {
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $text)
                            .font(.system(size: 18))
                            .focused($isNoteFocused)
                            .frame(width: .infinity)
                        if text.isEmpty {
                            Text("Note")
                                .font(.system(size: 18))
                                .foregroundColor(Color(.placeholderText))
                                .padding(.horizontal, 8)
                                .padding(.top, 10)
                                .allowsHitTesting(false)
                        }
                    }
                }
                
                Button(action: {
                    let note = NoteItem(context: _moc)
                    note.id = UUID()
                    note.notename = text
                    note.notecontent = text
                    
                    try? _moc.save()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 30, height: 34)
                }
                .padding(10)
                
            }
            Spacer()
        }
        .onAppear {
            isNoteFocused = true
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Custom Text")
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancle") {
                    hideKeyboard()
                }
            }
        }
    }
}





#Preview {
    NoteEditView()
}



