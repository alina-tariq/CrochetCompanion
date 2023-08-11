//
//  PatternsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct PatternsView: View {
    @State private var addPattern = false
    
    var body: some View {
        NavigationStack {
            Text("You don't have any patterns")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addPattern = true
                    } label: {
                        Image(systemName: "plus")
                                
                    }
                    .padding()
                }
            })
            .navigationTitle("Patterns")
            .sheet(isPresented: $addPattern) {
                NewPatternView()
            }
        }
    }
}

struct PatternsView_Previews: PreviewProvider {
    static var previews: some View {
        PatternsView()
    }
}
