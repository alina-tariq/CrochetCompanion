//
//  YarnList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI

struct YarnList: View {
    var yarnVM = YarnViewModel()
    
    var body: some View {
        let yarnCount = yarnVM.returnCount()
        let yarns = yarnVM.returnYarns()
        
        VStack {
            HStack {
                Text("Count: \(yarnCount)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.6)
                
                Spacer()
            }
            
            if yarnCount == 0 {
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
