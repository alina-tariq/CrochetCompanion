//
//  PatternList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct PatternList: View {
    @ObservedResults(Pattern.self) var patterns
    
    var body: some View {
        VStack {
            HStack {
                Text("\(patterns.count) \(patterns.count == 1 ? "pattern" : "patterns")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.6)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(patterns) { pattern in
                    PatternCard(pattern: pattern)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct PatternList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PatternList()
        }
    }
}
