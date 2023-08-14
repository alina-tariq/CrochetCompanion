//
//  TabBar.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct TabBar: View {
    @State private var showDialog = false
    
    var body: some View {
        TabView {
            AllPatternsView()
                .tabItem{
                    Image("Patterns")
                    Text("Patterns")
                }
            
            AllProjectsView()
                .tabItem {
                    Image("Projects")
                    Text("Projects")
                }
            
            YarnCollectionView()
                .tabItem {
                    Image("Yarn")
                    Text("Yarn")
                }
            
            GlossaryView()
                .clipped()
                .tabItem {
                    Image("Glossary")
                    Text("Glossary")
                }
            
//            SettingsView()
//                .tabItem {
//                    Image("Settings")
//                    Text("Settings")
//                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
