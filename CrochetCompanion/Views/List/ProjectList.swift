//
//  ProjectList.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI

struct ProjectList: View {
    var projectVM = ProjectViewModel()
    
    var body: some View {
        let projectCount = projectVM.returnCount()
        let projects = projectVM.returnProjects()
        
        VStack {
            HStack {
                Text("\(projectCount) \(projectCount == 1 ? "project" : "projects")")
                .font(.headline)
                .fontWeight(.medium)
                .opacity(0.6)
                
                Spacer()
            }
            
            if projectCount == 0 {
                VStack {
                    Text("You don't have any projects yet")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(projects) { project in
                        NavigationLink(destination: ProjectView(project: project)) {
                            ProjectCard(project: project)
                        }
                    }
                }
                .padding(.top)
            }
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
