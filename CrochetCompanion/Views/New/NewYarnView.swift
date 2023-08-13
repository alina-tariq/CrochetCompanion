//
//  NewYarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI
import RealmSwift

struct NewYarnView: View {
    @State private var brand: String = ""
    @State private var name: String = ""
    @State private var colour: String = ""
    @State private var colourFamily: ColourTypes = ColourTypes.unknown
    @State private var yarnWeight: YarnTypes = YarnTypes.unknown
    @State private var dyeLot: String = ""
    @State private var imageUrl: String = ""
    @State private var qty: Int = 0
    @State private var notes: String = ""
    
    @ObservedResults(Yarn.self) var yarnCollection
    
    @Environment(\.dismiss) var dismissYarnSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Brand *")) {
                    TextField("", text: $brand)
                }
                
                Section(header: Text("Name *")) {
                    TextField("", text: $name)
                }
                
                Section(header: Text("Colour *")) {
                    TextField("", text: $colour)
                }
                
                Section(header: Text("Colour Family *")) {
                    Picker("", selection: $colourFamily) {
                        ForEach(ColourTypes.allCases) { colourFamily in Text(colourFamily.rawValue)
                                .tag(colourFamily)
                        }
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
                    .labelsHidden()
                }
                
                Section(header: Text("Dye Lot")) {
                    TextField("", text: $dyeLot)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $imageUrl)
                }
                
                // TODO: make smaller
                Section(header: Text("Quantity *")) {
                    Picker("", selection: $qty) {
                        ForEach((0...50), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 50)
                        
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
                        let newYarn = Yarn()
                        newYarn.brand = brand
                        newYarn.name = name
                        newYarn.colour = colour
                        newYarn.colourFamily = colourFamily.rawValue
                        newYarn.yarnWeight = yarnWeight.rawValue
                        newYarn.dyeLot = dyeLot
                        newYarn.imageUrl = imageUrl
                        newYarn.qty = qty
                        newYarn.notes = notes
                        
                        $yarnCollection.append(newYarn)
                        
                        dismissYarnSheet()
                    } label: {
                        Label("", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .padding()
                    .disabled(brand.isEmpty || name.isEmpty || colour.isEmpty || qty < 1 || colourFamily == ColourTypes.unknown || yarnWeight == YarnTypes.unknown)
                }
            })
            .navigationTitle("New Yarn")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewYarnView_Previews: PreviewProvider {
    static var previews: some View {
        NewYarnView()
    }
}
