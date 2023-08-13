//
//  YarnView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct YarnCollectionView: View {
    @State private var addYarn = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                YarnList()
            }
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
            .navigationBarBackButtonHidden()
            .navigationTitle("Yarn Collection")
            .sheet(isPresented: $addYarn) {
                NewYarnView()
            }
        }
    }
}

struct YarnCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        YarnCollectionView()
    }
}
