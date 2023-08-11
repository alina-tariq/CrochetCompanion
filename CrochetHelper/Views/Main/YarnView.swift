//
//  YarnView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct YarnView: View {
    var body: some View {
        NavigationStack {
            Text("You don't have any yarns")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NewYarnView()
                    } label: {
                        Image(systemName: "plus")
                                
                    }
                    .padding()
                }
            })
            .navigationTitle("Yarn Collection")
        }
    }
}

struct YarnView_Previews: PreviewProvider {
    static var previews: some View {
        YarnView()
    }
}
