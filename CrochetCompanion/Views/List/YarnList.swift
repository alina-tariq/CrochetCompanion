//
//  YarnList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct YarnList: View {
    @ObservedResults(Yarn.self) var yarns
    
    var body: some View {
        VStack {
            HStack {
                Text("Count: \(yarns.count)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.6)
                
                Spacer()
            }
            
            if yarns.count == 0 {
                VStack {
                    Text("You don't have any yarns yet")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(yarns) { yarn in
                        NavigationLink(destination: YarnView(yarn: yarn)) {
                            YarnCard(yarn: yarn)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .padding(.horizontal)
    }
}

struct YarnList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            YarnList()
        }
    }
}
