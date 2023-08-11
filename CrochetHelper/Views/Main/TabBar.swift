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
            
            SettingsView()
                .tabItem {
                    Image("Settings")
                    Text("Settings")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
