//
//  GlossaryView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct GlossaryView: View {
    @State private var addTerm = false
    
    var body: some View {
        NavigationStack {
            TermList()
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addTerm = true
                    } label: {
                        Image(systemName: "plus")
                                
                    }
                    .padding()
                }
            })
            .navigationTitle("Glossary Terms")
            .sheet(isPresented: $addTerm) {
                NewTermView()
            }
        }
    }
}

struct GlossaryView_Previews: PreviewProvider {
    static var previews: some View {
        GlossaryView()
    }
}
