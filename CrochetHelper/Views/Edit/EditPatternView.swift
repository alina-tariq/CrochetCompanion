//
//  EditPatternView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI
import RealmSwift

struct EditPatternView: View {
    @ObservedRealmObject var pattern: Pattern
    
    @Environment(\.dismiss) var dismissPatternSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Pattern Name *")) {
                    TextField("\(pattern.name)", text: $pattern.name)
                }
                
                Section(header: Text("Image URL")) {
                    TextField("\(pattern.imageUrl)", text: $pattern.imageUrl)
                }
                
                Section(header: Text("Hook Size")) {
                    Picker("Choose a hook size", selection: $pattern.hook) {
                        ForEach(HookSizes.allCases) { hook in
                            Text(hook.id)
                                .tag(hook)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn Weight")) {
                    Picker("Choose a yarn weight", selection: $pattern.yarnWeight) {
                        ForEach(YarnTypes.allCases) { yarnWeight in
                            Text(yarnWeight.id)
                                .tag(YarnTypes.light)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Stitches")) {
                    TextField("\(pattern.stitches)", text: $pattern.stitches)
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("\(pattern.patternUrl)", text: $pattern.patternUrl)
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $pattern.instructions)
                        .frame(minHeight: 60)
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $pattern.notes)
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
//                        let newPattern = Pattern()
//                        newPattern.name = name
//                        newPattern.imageUrl = imageUrl
//                        newPattern.instructions = instructions
//                        newPattern.stitches = stitches
//                        newPattern.patternUrl = patternUrl
//                        newPattern.notes = notes
//
//                        if (hook != HookSizes.unknown) {
//                            newPattern.hook = hook.id
//                        }
//
//                        if (yarnWeight != YarnTypes.unknown) {
//                            newPattern.yarnWeight = yarnWeight.id
//                        }
//
//                        $patterns.append(newPattern)
//
                        dismissPatternSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                }
            })
            .navigationTitle("Edit Pattern")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditPatternView_Previews: PreviewProvider {
    static var previews: some View {
        EditPatternView(pattern: Pattern())
    }
}
