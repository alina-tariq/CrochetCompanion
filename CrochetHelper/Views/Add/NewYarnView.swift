//
//  NewYarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-10.
//

import SwiftUI

struct NewYarnView: View {
    var body: some View {
        NavigationStack {
            Text("Add new yarn")
                .padding()
                .navigationTitle("New Yarn")
        }
    }
}

struct NewYarnView_Previews: PreviewProvider {
    static var previews: some View {
        NewYarnView()
    }
}
