//
//  PatternsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct AllPatternsView: View {
    @State private var addPattern = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                PatternList()
            }
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

struct AllPatternsView_Previews: PreviewProvider {
    static var previews: some View {
        AllPatternsView()
    }
}
