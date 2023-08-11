//
//  ProjectsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct ProjectsView: View {
    @State private var addProject = false
    
    var body: some View {
        NavigationStack {
            Text("You don't have any projects")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addProject = true
                    } label: {
                        Image(systemName: "plus")
                                
                    }
                    .padding()
                }
            })
            .navigationTitle("Projects")
            .sheet(isPresented: $addProject) {
                NewProjectView()
            }
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
