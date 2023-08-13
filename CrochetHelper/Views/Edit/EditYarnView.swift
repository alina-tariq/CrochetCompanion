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
    
    @Environment(\.dismiss) var dismissYarnSheet
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Brand *")) {
                    TextField("", text: $yarn.brand)
                }
                
                Section(header: Text("Name *")) {
                    TextField("", text: $yarn.name)
                }
                
                Section(header: Text("Colour *")) {
                    TextField("", text: $yarn.colour)
                }
                
                Section(header: Text("Colour Family *")) {
                    Picker("", selection: $yarn.colourFamily) {
                        ForEach(ColourTypes.allCases) { colourFamily in Text(colourFamily.rawValue)
                                .tag(colourFamily)
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Yarn Weight *")) {
                    Picker("", selection: $yarn.yarnWeight) {
                        ForEach(YarnTypes.allCases) { yarnWeight in
                            Text(yarnWeight.rawValue)
                                .tag(yarnWeight)
                                
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Dye Lot")) {
                    TextField("", text: $yarn.dyeLot)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("", text: $yarn.imageUrl)
                }
                
                // TODO: make smaller
                Section(header: Text("Quantity *")) {
                    Picker("", selection: $yarn.qty) {
                        ForEach((0...50), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                Section(header: Text("Additional Notes")) {
                    TextEditor(text: $yarn.notes)
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
//                        let newYarn = Yarn()
//                        newYarn.brand = brand
//                        newYarn.name = name
//                        newYarn.colour = colour
//                        newYarn.colourFamily = colourFamily.rawValue
//                        newYarn.yarnWeight = yarnWeight.rawValue
//                        newYarn.dyeLot = dyeLot
//                        newYarn.imageUrl = imageUrl
//                        newYarn.qty = qty
//                        newYarn.notes = notes
//
//                        $yarnCollection.append(newYarn)
//
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
