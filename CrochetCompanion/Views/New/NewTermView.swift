//
//  NewTermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewTermView: View {
    var termVM = TermViewModel()
    
    @State private var name: String = ""
    @State private var instructions: String = ""
    @State private var imageUrl: String = ""
    @State private var videoUrl: String = ""
    
    @Environment(\.dismiss) var dismissTermSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name *")) {
                    TextField("", text: $name)
                }
                
                Section(header: Text("Instructions *")) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 60, maxHeight: 200)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                }
                
                // TODO: embed video?
                Section(header: Text("Video")) {
                    TextField("", text: $videoUrl)
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
                        termVM.addTerm(name: name, imageUrl: imageUrl, videoUrl: videoUrl, instructions: instructions)
                        dismissTermSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                    .disabled(name.isEmpty || instructions.isEmpty)
                }
            })
            .navigationTitle("New Glossary Term")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewTermView_Previews: PreviewProvider {
    static var previews: some View {
        NewTermView()
    }
}
