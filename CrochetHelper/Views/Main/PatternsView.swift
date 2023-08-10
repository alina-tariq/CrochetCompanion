//
//  PatternsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct PatternsView: View {
    var body: some View {
        NavigationStack {
            Text("You haven't created any patterns yet")
                .navigationTitle("Patterns")
        }
    }
}

struct PatternsView_Previews: PreviewProvider {
    static var previews: some View {
        PatternsView()
    }
}
