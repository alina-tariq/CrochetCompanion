//
//  ProjectView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct ProjectCard: View {
    var project: Project
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: project.imageUrl)) { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        ZStack {
                            Text(project.name)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(6)
                        }
                        .background(.black)
                        .opacity(0.8)
                        .cornerRadius(10.0)
                        .frame(maxWidth: 140)
                        .padding(6)
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(project.name)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(minWidth: 140, maxWidth: 155)
                            .padding()
                    }
            }
        }
        .frame(width: 160, height: 217)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCard(project: Project())
    }
}
