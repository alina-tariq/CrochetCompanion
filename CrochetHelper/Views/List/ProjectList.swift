//
//  ProjectList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct ProjectList: View {
    @StateObject var projectVM = ProjectViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("\(projectVM.projects.count) \(projectVM.projects.count == 1 ? "project" : "projects")")
                .font(.headline)
                .fontWeight(.medium)
                .opacity(0.6)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(projectVM.projects) { project in
                    NavigationLink(destination: ProjectView(project: project)) {
                        ProjectCard(project: project)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ProjectList()
        }
    }
}
