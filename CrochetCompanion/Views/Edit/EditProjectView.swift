//
//  EditFileView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI

struct EditProjectView: View {
    var project: Project
    var projectVM = ProjectViewModel()
    
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var yarn: String = ""
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var finished: Bool = false
    @State private var instructions: String = ""
    @State private var notes: String = ""
    
    @Environment(\.dismiss) var dismissProjectSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Project Name *")) {
                    TextField("", text: $name)
                        .onAppear {
                            name = project.name
                        }
                }
                
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                        .onAppear{
                            imageUrl = project.imageUrl
                        }
                }
                
                Section(header: Text("Yarn")) {
                    TextField("", text: $yarn)
                        .onAppear{
                            yarn = project.yarn
                        }
                }
                
                Section(header: Text("Stitches")) {
                    TextField("", text: $stitches)
                        .onAppear{
                            stitches = project.stitches
                        }
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("", text: $patternUrl)
                        .onAppear{
                            patternUrl = project.patternUrl
                        }
                }
                
                Section() {
                    Toggle("Finished?", isOn: $finished)
                        .onAppear{
                            finished = project.finished
                        }
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $instructions)
                        .onAppear{
                            instructions = project.instructions
                        }
                        .frame(minHeight: 50, maxHeight: 200)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 50, maxHeight: 200)
                        .onAppear{
                            notes = project.notes
                        }
                    
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
                        let thawedProject = project.thaw()
                        if thawedProject!.isInvalidated == false {
                            // get the object's realm
                            let thawedRealm = thawedProject!.realm!
                            
                            try! thawedRealm.write {
                                thawedProject!.name = name
                                thawedProject!.imageUrl = imageUrl
                                thawedProject!.yarn = yarn
                                thawedProject!.stitches = stitches
                                thawedProject!.patternUrl = patternUrl
                                thawedProject!.finished = finished
                                thawedProject!.instructions = instructions
                                thawedProject!.notes = notes
                            }
                        }
                        projectVM.editProject(project: project, name: name, imageUrl: imageUrl, yarn: yarn, stitches: stitches, patternUrl: patternUrl, notes: notes, finished: finished, instructions: instructions)
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
