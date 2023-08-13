//
//  EditTermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI
import RealmSwift

struct EditTermView: View {
    @ObservedRealmObject var term: GlossaryTerm
    
    @Environment(\.dismiss) var dismissTermSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name *")) {
                    TextField("", text: $term.name)
                }
                
                Section(header: Text("Instructions *")) {
                    TextEditor(text: $term.instructions)
                        .frame(minHeight: 60)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $term.imageUrl)
                }
                
                // TODO: embed video?
                Section(header: Text("Video")) {
                    TextField("", text: $term.videoUrl)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismissTermSheet()
                    } label: {
                        Label("X", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }.padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        let newTerm = GlossaryTerm()
//                        newTerm.name = name
//                        newTerm.instructions = instructions
//                        newTerm.imageUrl = imageUrl
//                        newTerm.videoUrl = videoUrl
//
//                        $terms.append(newTerm)
//
                        dismissTermSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                }
            })
            .navigationTitle("New Glossary Term")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditTermView_Previews: PreviewProvider {
    static var previews: some View {
        EditTermView(term: GlossaryTerm())
    }
}
