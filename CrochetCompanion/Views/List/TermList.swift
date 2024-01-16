//
//  TermList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI

struct TermList: View {
    var termVM = TermViewModel()
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        let termCount = termVM.returnCount()
        let terms = termVM.returnTerms()
        
        VStack {
            HStack {
                Text("\(termCount) \(termCount == 1 ? "term" : "terms")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.6)
                
                Spacer()
            }
            .padding(.horizontal)
            
            List {
                ForEach(terms) { term in
                    NavigationLink(destination: TermView(term: term)) {
                        TermCard(term: term)
                    }
                }
            }
            .listStyle(.plain)
        }
        
    }
}

struct TermList_Previews: PreviewProvider {
    static var previews: some View {
        TermList()
    }
}
