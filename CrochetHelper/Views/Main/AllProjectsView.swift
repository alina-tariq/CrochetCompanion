//
//  ProjectsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct AllProjectsView: View {
    @State private var addProject = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProjectList()
            }
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
            .navigationBarBackButtonHidden()
            .navigationTitle("Projects")
            .sheet(isPresented: $addProject) {
                NewProjectView()
            }
        }
    }
}

struct AllProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        AllProjectsView()
    }
}
