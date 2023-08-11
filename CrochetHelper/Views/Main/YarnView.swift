//
//  YarnView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct YarnView: View {
    @State private var addYarn = false
    
    var body: some View {
        NavigationStack {
            Text("You don't have any yarns")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addYarn = true
                    } label: {
                        Image(systemName: "plus")
                                
                    }
                    .padding()
                }
            })
            .navigationTitle("Yarn Collection")
            .sheet(isPresented: $addYarn) {
                NewYarnView()
            }
        }
    }
}

struct YarnView_Previews: PreviewProvider {
    static var previews: some View {
        YarnView()
    }
}
