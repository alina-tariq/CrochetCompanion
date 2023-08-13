//
//  YarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-11.
//

import SwiftUI
import RealmSwift

struct YarnCard: View {
    var yarn: Yarn
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: yarn.imageUrl)) { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        ZStack {
                            Text(yarn.name + " " + yarn.colour)
                                .font(.callout)
                                .padding(6)
                                .foregroundColor(.white)
                        }
                        .background(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10.0)
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
                        ZStack {
                            Text(yarn.name + " " + yarn.colour)
                                .font(.callout)
                                .padding(6)
                                .foregroundColor(.white)
                        }
                        .opacity(0.8)
                        .cornerRadius(10.0)
                        .padding(6)
                    }
            }
        }
        .frame(width: 160, height: 217)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct YarnCard_Previews: PreviewProvider {
    static var previews: some View {
        YarnCard(yarn: Yarn())
    }
}
