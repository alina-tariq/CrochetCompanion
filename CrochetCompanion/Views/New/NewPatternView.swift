//
//  NewPatternView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI
import RealmSwift

struct NewPatternView: View {
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var hook: HookSizes = HookSizes.unknown
    @State private var yarnWeight: YarnTypes = YarnTypes.unknown
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var instructions: String = ""
    @State private var notes: String = ""
    
    @ObservedResults(Pattern.self) var patterns
    
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
                    Picker("Choose a hook size", selection: $hook) {
                        ForEach(HookSizes.allCases) { hook in
                            Text(hook.id)
                                .tag(hook)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn Weight")) {
                    Picker("Choose a yarn weight", selection: $yarnWeight) {
                        ForEach(YarnTypes.allCases) { yarnWeight in
                            Text(yarnWeight.id)
                                .tag(yarnWeight)
                                
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
                    TextEditor(text: $instructions)
                        .frame(minHeight: 60, maxHeight: 100)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 60, maxHeight: 100)
                        
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
                        let newPattern = Pattern()
                        newPattern.name = name
                        newPattern.imageUrl = imageUrl
                        newPattern.instructions = instructions
                        newPattern.stitches = stitches
                        newPattern.patternUrl = patternUrl
                        newPattern.notes = notes
                        newPattern.hook = hook.id
                        newPattern.yarnWeight = yarnWeight.id
                        
                        $patterns.append(newPattern)
                        
                        dismissPatternSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                    .disabled(name.isEmpty || instructions.isEmpty)
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
