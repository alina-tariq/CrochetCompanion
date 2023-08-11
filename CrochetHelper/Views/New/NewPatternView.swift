//
//  NewPatternView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct NewPatternView: View {
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var hook: HookSizes = HookSizes.b
    @State private var yarnType: YarnTypes = YarnTypes.lace
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var pattern: String = ""
    @State private var notes: String = ""
    
    @Environment(\.dismiss) var dismissPatternSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Pattern Name *")) {
                    TextField("", text: $name)
                }
                
                Section(header: Text("Image URL")) {
                    TextField("", text: $imageUrl)
                }
                
                Section(header: Text("Hook Size")) {
                    Picker("", selection: $hook) {
                        ForEach(HookSizes.allCases) { hook in
                            Text(hook.id)
                                .tag(hook)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn Weight")) {
                    Picker("", selection: $yarnType) {
                        ForEach(YarnTypes.allCases) { yarnType in Text(yarnType.id)
                                .tag(yarnType)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Stiches")) {
                    TextField("", text: $stitches)
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("", text: $patternUrl)
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $pattern)
                        .frame(minHeight: 60)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 60)
                        
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismissPatternSheet()
                    } label: {
                        Label("X", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }.padding()
                }
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
            .navigationTitle("Create New Pattern")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewPatternView_Previews: PreviewProvider {
    static var previews: some View {
        NewPatternView()
    }
}
