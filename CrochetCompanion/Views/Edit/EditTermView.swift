//
//  EditTermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI
import RealmSwift

struct EditTermView: View {
    @ObservedRealmObject var term: Term
    
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
                        .onAppear {
                            name = term.name
                        }
                }
                
                Section(header: Text("Instructions *")) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 60, maxHeight: 200)
                        .onAppear {
                            instructions = term.instructions
                        }
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                        .onAppear {
                            imageUrl = term.imageUrl
                        }
                }
                
                // TODO: embed video?
                Section(header: Text("Video")) {
                    TextField("", text: $videoUrl)
                        .onAppear {
                            videoUrl = term.videoUrl
                        }
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
                        let thawedTerm = term.thaw()
                        if thawedTerm!.isInvalidated == false {
                            // get the object's realm
                            let thawedRealm = thawedTerm!.realm!
                            
                            try! thawedRealm.write {
                                thawedTerm!.name = name
                                thawedTerm!.instructions = instructions
                                thawedTerm!.imageUrl = imageUrl
                                thawedTerm!.videoUrl = videoUrl
                            }
                        }
                        dismissTermSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                }
            })
            .navigationTitle("New Glossary Term")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditTermView_Previews: PreviewProvider {
    static var previews: some View {
        EditTermView(term: Term())
    }
}
