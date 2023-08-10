//
//  ProjectsView.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

struct ProjectsView: View {
    var body: some View {
        NavigationStack {
            Text("You haven't added any projects yet")
                .padding()
                .navigationTitle("Projects Tracker")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
