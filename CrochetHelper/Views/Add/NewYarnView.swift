//
//  NewYarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewYarnView: View {
    @State private var brand: String = ""
    @State private var name: String = ""
    @State private var colour: String = ""
    @State private var imageUrl: String = ""
    @State private var qty: Int = 0
    @State private var notes: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Brand *")) {
                    TextField("Brand", text: $brand)
                }
                
                Section(header: Text("Name *")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Colour *")) {
                    TextField("Colour", text: $colour)
                }
                
                // TODO: save images locally
                Section(header: Text("Image")) {
                    TextField("Enter image URL", text: $imageUrl)
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
                    .disabled(brand.isEmpty || name.isEmpty || colour.isEmpty || qty < 1)
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
