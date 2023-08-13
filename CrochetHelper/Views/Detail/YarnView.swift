//
//  YarnView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import SwiftUI

struct YarnView: View {
    var yarn: Yarn
    @State private var editYarn = false
    @State private var goBack = false
    
    var body: some View {
        ScrollView {
            Text(yarn.name + " - " + yarn.colour)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
            
            if (yarn.imageUrl != "") {
                AsyncImage(url: URL(string: yarn.imageUrl)) { image in image
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
                    Text("Brand: ")
                        .font(.headline) +
                    Text("\(yarn.brand)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Yarn Weight: ")
                        .font(.headline) +
                    Text(" \(yarn.yarnWeight == "" ? "Unknown" : yarn.yarnWeight)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Colour Family: ")
                        .font(.headline) +
                    Text("\(yarn.colourFamily)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Quantity: ")
                        .font(.headline) +
                    Text("\(yarn.qty)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Dye Lot: ")
                        .font(.headline) +
                    Text(" \(yarn.dyeLot == "" ? "Unknown" : yarn.dyeLot)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Notes:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(yarn.notes)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.horizontal)
            
            NavigationStack {
                VStack {
                    Button {
                        let thawedPattern = yarn.thaw()
                        if thawedPattern!.isInvalidated == false { //ensure it's a valid item
                            
                            let thawedRealm = thawedPattern!.realm! //get the realm it belongs to
                            
                            try! thawedRealm.write {
                                thawedRealm.delete(thawedPattern!)
                            }
                        }
                        self.goBack = true
                    } label: {
                        Text("Delete Yarn")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationDestination(isPresented: $goBack) {
                YarnCollectionView()
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editYarn = true
                } label: {
                    Text("Edit")
                }
                .padding()
            }
        })
        .sheet(isPresented: $editYarn) {
            EditYarnView(yarn: yarn)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct YarnView_Previews: PreviewProvider {
    static var previews: some View {
        YarnView(yarn: Yarn())
    }
}
