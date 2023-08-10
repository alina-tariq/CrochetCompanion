//
//  NewProjectView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewProjectView: View {
    var body: some View {
        NavigationStack {
            Text("Start new project")
                .padding()
                .navigationTitle("New Project")
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
