//
//  ProjectView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import SwiftUI

struct ProjectView: View {
    var project: Project
    @State private var editProject = false
    @State private var goBack = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Text(project.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
            
            if (project.imageUrl != "") {
                AsyncImage(url: URL(string: project.imageUrl)) { image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                .clipShape(Rectangle())
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            VStack(spacing: 20) {
                VStack{
                    Text("Yarn: ")
                        .font(.headline) +
                    Text(" \(project.yarn == "" ? "Unknown" : project.yarn)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Stitches: ")
                        .font(.headline) +
                    Text(" \(project.stitches == "" ? "Not specified" : project.stitches)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    let link = "[Visit](\(project.patternUrl))"
                    
                    project.patternUrl == ""
                    ? Text("Pattern Link: ")
                        .font(.headline) + Text("Not specified")
                    : Text("Pattern Link: ")
                        .font(.headline) + Text(.init(link))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Finished: ")
                        .font(.headline) +
                    Text(" \(project.finished == true ? "Yes" : "No")")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Instructions:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(project.instructions)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Notes:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(project.notes)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.horizontal)
            
            Button(action: {
                let thawedPattern = project.thaw()
                if thawedPattern!.isInvalidated == false { //ensure it's a valid item
                    
                    let thawedRealm = thawedPattern!.realm! //get the realm it belongs to
                    
                    try! thawedRealm.write {
                        thawedRealm.delete(thawedPattern!)
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Delete Project")
            }
            .buttonStyle(.borderedProminent)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editProject = true
                } label: {
                    Text("Edit")
                }
                .padding()
            }
        })
        .sheet(isPresented: $editProject) {
            EditProjectView(project: project)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: Project())
    }
}
