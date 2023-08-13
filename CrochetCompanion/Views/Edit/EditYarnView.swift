//
//  EditYarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-13.
//

import SwiftUI
import RealmSwift

struct EditYarnView: View {
    @ObservedRealmObject var yarn: Yarn
    
    @State private var brand: String = ""
    @State private var name: String = ""
    @State private var colour: String = ""
    @State private var colourFamily: ColourTypes = ColourTypes.unknown
    @State private var yarnWeight: YarnTypes = YarnTypes.unknown
    @State private var dyeLot: String = ""
    @State private var imageUrl: String = ""
    @State private var qty: Int = 0
    @State private var notes: String = ""
    
    @Environment(\.dismiss) var dismissYarnSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Brand *")) {
                    TextField("", text: $brand)
                        .onAppear {
                            brand = yarn.brand
                        }
                }
                
                Section(header: Text("Name *")) {
                    TextField("", text: $name)
                        .onAppear {
                            name = yarn.name
                        }
                }
                
                Section(header: Text("Colour *")) {
                    TextField("", text: $colour)
                        .onAppear {
                            colour = yarn.colour
                        }
                }
                
                Section(header: Text("Colour Family *")) {
                    Picker("", selection: $colourFamily) {
                        ForEach(ColourTypes.allCases) { colourFamily in Text(colourFamily.rawValue)
                                .tag(colourFamily)
                        }
                    }
                    .onAppear {
                        colourFamily = ColourTypes(rawValue: yarn.colourFamily)!
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn Weight *")) {
                    Picker("", selection: $yarnWeight) {
                        ForEach(YarnTypes.allCases) { yarnWeight in
                            Text(yarnWeight.rawValue)
                                .tag(yarnWeight)
                        }
                    }
                    .onAppear {
                        yarnWeight = YarnTypes(rawValue: yarn.yarnWeight)!
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Dye Lot")) {
                    TextField("", text: $dyeLot)
                        .onAppear {
                            dyeLot = yarn.dyeLot
                        }
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                        .onAppear {
                            imageUrl = yarn.imageUrl
                        }
                }
                
                // TODO: make smaller
                Section(header: Text("Quantity *")) {
                    Picker("", selection: $qty) {
                        ForEach((0...50), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .onAppear {
                        qty = yarn.qty
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 50, maxHeight: 100)
                        .onAppear {
                            notes = yarn.notes
                        }
                        
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismissYarnSheet()
                    } label: {
                        Label("X", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }.padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let thawedYarn = yarn.thaw()
                        if thawedYarn!.isInvalidated == false {
                            // get the object's realm
                            let thawedRealm = thawedYarn!.realm!
                            
                            try! thawedRealm.write {
                                thawedYarn!.brand = brand
                                thawedYarn!.name = name
                                thawedYarn!.colour = colour
                                thawedYarn!.colourFamily = colourFamily.rawValue
                                thawedYarn!.yarnWeight = yarnWeight.rawValue
                                thawedYarn!.dyeLot = dyeLot
                                thawedYarn!.imageUrl = imageUrl
                                thawedYarn!.qty = qty
                                thawedYarn!.notes = notes
                            }
                        }
                        dismissYarnSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                }
            })
            .navigationTitle("New Yarn")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditYarnView_Previews: PreviewProvider {
    static var previews: some View {
        EditYarnView(yarn: Yarn())
    }
}
