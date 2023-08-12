//
//  NewProjectView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI
import RealmSwift

struct NewProjectView: View {
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var yarn: String = ""
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var instructions: String = ""
    @State private var notes: String = ""
    
    @ObservedResults(Project.self) var projects
    
    @Environment(\.dismiss) var dismissProjectSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Project Name *")) {
                    TextField("", text: $name)
                }
                
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                }
                
                Section(header: Text("Yarn")) {
                    TextField("", text: $stitches)
                }
                
                Section(header: Text("Stiches")) {
                    TextField("", text: $stitches)
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("", text: $patternUrl)
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 50)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 50)
                    
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismissProjectSheet()
                    } label: {
                        Label("X", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }.padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newProject = Project()
                        newProject.name = name
                        newProject.imageUrl = imageUrl
                        newProject.yarn = yarn
                        newProject.stitches = stitches
                        newProject.patternUrl = patternUrl
                        newProject.instructions = instructions
                        newProject.notes = notes
                        
                        if (imageUrl != "") {
                            newProject.imageUrl = imageUrl
                        }
                        
                        $projects.append(newProject)
                        
                        dismissProjectSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                    .disabled(name.isEmpty || instructions.isEmpty)
                }
            })
            .navigationTitle("Start New Project")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
