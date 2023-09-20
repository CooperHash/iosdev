//
//  NoteContentDetailView.swift
//  iosdev
//
//  Created by kai cooper on 9/15/23.
//

import SwiftUI
import MarkdownUI

struct NoteContentDetailView: View {
    let notename: String
    let notecontent: String
    
    var body: some View {
        VStack {
            Markdown(notecontent)
                .padding(.horizontal, 10)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
            Spacer()
        }
        .navigationTitle(notename ?? "")
    }
}
