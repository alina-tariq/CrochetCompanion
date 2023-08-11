//
//  NewProjectView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewProjectView: View {
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var hook: HookSizes = HookSizes.b
    @State private var yarn: String = ""
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var pattern: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Project Name *")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Image")) {
                    TextField("Enter image URL", text: $imageUrl)
                }
                
                Section(header: Text("Hook Size")) {
                    Picker("", selection: $hook) {
                        ForEach(HookSizes.allCases) {
                            hook in Text(hook.rawValue)
                                .tag(hook)
                            
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn")) {
                    TextField("Enter yarns used", text: $stitches)
                }
                
                Section(header: Text("Stiches")) {
                    TextField("Enter stitches used", text: $stitches)
                }
                
                Section(header: Text("Link")) {
                    TextField("Enter pattern URL", text: $patternUrl)
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $pattern)
                        .frame(minHeight: 50)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 50)
                    
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
                    .disabled(name.isEmpty || pattern.isEmpty)
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
