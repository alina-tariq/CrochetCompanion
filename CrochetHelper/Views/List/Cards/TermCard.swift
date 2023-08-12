//
//  TermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct TermCard: View {
    var term: GlossaryTerm
    
    var body: some View {
        Text(term.name)
            .font(.title3)
            .fontWeight(.medium)
        Text(term.instructions)
            .font(.callout)
            .fontWeight(.medium)
    }
}

struct TermCard_Previews: PreviewProvider {
    static var previews: some View {
        TermCard(term: GlossaryTerm())
    }
}
