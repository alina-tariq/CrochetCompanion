//
//  TabBar.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            PatternsView()
                .tabItem{
                    Image("Patterns")
                    Text("Patterns")
                }
            
            ProjectsView()
                .tabItem {
                    Image("Projects")
                    Text("Projects")
                }
            
//            NewPatternView()
//                .tabItem {
//                    Label("New", systemImage: "plus.circle.fill")
//                }
            
            YarnView()
                .tabItem {
                    Image("Yarn")
                    Text("Yarn")
                }
            
            GlossaryView()
                .tabItem {
                    Image("Glossary")
                    Text("Glossary")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
