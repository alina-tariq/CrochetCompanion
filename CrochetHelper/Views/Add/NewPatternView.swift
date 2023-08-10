//
//  NewPatternView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct NewPatternView: View {
    var body: some View {
        NavigationStack {
            Text("Add new pattern")
                .padding()
                .navigationTitle("New Pattern")
        }
    }
}

struct NewPatternView_Previews: PreviewProvider {
    static var previews: some View {
        NewPatternView()
    }
}
