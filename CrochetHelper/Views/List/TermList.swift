//
//  TermList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct TermList: View {
    @ObservedResults(GlossaryTerm.self, sortDescriptor: SortDescriptor(keyPath: "name", ascending: true)) var terms
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        VStack {
            HStack {
                Text("\(terms.count) \(terms.count == 1 ? "term" : "terms")")
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
