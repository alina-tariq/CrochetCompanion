//
//  EditFileView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI
import RealmSwift

struct EditProjectView: View {
    @ObservedRealmObject var project: Project
    
    @Environment(\.dismiss) var dismissProjectSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Project Name *")) {
                    TextField("", text: $project.name)
                }
                
                Section(header: Text("Image")) {
                    TextField("", text: $project.imageUrl)
                }
                
                Section(header: Text("Yarn")) {
                    TextField("", text: $project.stitches)
                }
                
                Section(header: Text("Stiches")) {
                    TextField("", text: $project.stitches)
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("", text: $project.patternUrl)
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $project.instructions)
                        .frame(minHeight: 50)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $project.notes)
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
//                        let newProject = Project()
//                        newProject.name = name
//                        newProject.imageUrl = imageUrl
//                        newProject.yarn = yarn
//                        newProject.stitches = stitches
//                        newProject.patternUrl = patternUrl
//                        newProject.instructions = instructions
//                        newProject.notes = notes
//
//                        $projects.append(newProject)
//
                        dismissProjectSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                }
            })
            .navigationTitle("Start New Project")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: Project())
    }
}
