//
//  NewTermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewTermView: View {
    @State private var name: String = ""
    @State private var instructions: String = ""
    @State private var imageUrl: String = ""
    @State private var videoUrl: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name *")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Instructions *")) {
                    TextField("Instructions", text: $instructions)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("Enter image URL", text: $imageUrl)
                }
                
                // TODO: embed video?
                Section(header: Text("Video")) {
                    TextField("Enter video URL", text: $videoUrl)
                }
            }
            .toolbar(content: {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//
//                    } label: {
//                        Label("X", systemImage: "xmark")
//                            .labelStyle(.iconOnly)
//                    }.padding()
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
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
