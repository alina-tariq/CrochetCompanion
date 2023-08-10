//
//  NewTermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewTermView: View {
    var body: some View {
        NavigationStack {
            Text("Add new glossary term")
                .padding()
                .navigationTitle("New Term")
        }
    }
}

struct NewTermView_Previews: PreviewProvider {
    static var previews: some View {
        NewTermView()
    }
}
