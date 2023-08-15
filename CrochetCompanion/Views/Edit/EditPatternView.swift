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
    
    @State private var name: String = ""
    @State private var imageUrl: String = ""
    @State private var hook: HookSizes = HookSizes.unknown
    @State private var yarnWeight: YarnTypes = YarnTypes.unknown
    @State private var stitches: String = ""
    @State private var patternUrl: String = ""
    @State private var instructions: String = ""
    @State private var notes: String = ""
    
    @Environment(\.dismiss) var dismissPatternSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Pattern Name *")) {
                    TextField("", text: $name)
                        .onAppear {
                            name = pattern.name
                        }
                }
                
                Section(header: Text("Image URL")) {
                    TextField("", text: $imageUrl)
                        .onAppear {
                            imageUrl = pattern.imageUrl
                        }
                }
                
                Section(header: Text("Hook Size")) {
                    Picker("Choose a hook size", selection: $hook) {
                        ForEach(HookSizes.allCases) { hook in
                            Text(hook.id)
                                .tag(hook)
                            
                        }
                    }
                    .onAppear {
                        hook = HookSizes(rawValue: pattern.hook)!
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
                    .onAppear {
                        yarnWeight = YarnTypes(rawValue: pattern.yarnWeight)!
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Stitches")) {
                    TextField("", text: $stitches)
                        .onAppear {
                            stitches = pattern.stitches
                        }
                }
                
                Section(header: Text("Pattern Link")) {
                    TextField("", text: $patternUrl)
                        .onAppear {
                            patternUrl = pattern.patternUrl
                        }
                }
                
                Section(header: Text("Pattern *")) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 60, maxHeight: 200)
                        .onAppear {
                            instructions = pattern.instructions
                        }
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 60, maxHeight: 200)
                        .onAppear {
                            notes = pattern.notes
                        }
                    
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
                        let thawedPattern = pattern.thaw()
                        if thawedPattern!.isInvalidated == false {
                            // get the object's realm
                            let thawedRealm = thawedPattern!.realm!
                            
                            try! thawedRealm.write {
                                thawedPattern!.name = name
                                thawedPattern!.imageUrl = imageUrl
                                thawedPattern!.instructions = instructions
                                thawedPattern!.stitches = stitches
                                thawedPattern!.patternUrl = patternUrl
                                thawedPattern!.notes = notes
                                thawedPattern!.hook = hook.id
                                thawedPattern!.yarnWeight = yarnWeight.id
                            }
                        }
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
