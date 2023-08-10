//
//  GlossaryView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct GlossaryView: View {
    var body: some View {
        NavigationStack {
            Text("List of Terms")
                .padding()
                .navigationTitle("Glossary")
        }
    }
}

struct GlossaryView_Previews: PreviewProvider {
    static var previews: some View {
        GlossaryView()
    }
}
