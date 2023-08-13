//
//  PatternView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import SwiftUI
import RealmSwift

struct PatternView: View {
    var pattern: Pattern
    @State private var editPattern = false
    @State private var goBack = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Text(pattern.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
            
            if (pattern.imageUrl != "") {
                AsyncImage(url: URL(string: pattern.imageUrl)) { image in image
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
                    Text("Hook Size: ")
                        .font(.headline) +
                    Text(" \(pattern.hook == HookSizes.unknown.id ? "Unknown" : pattern.hook)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Yarn Weight: ")
                        .font(.headline) +
                    Text(" \(pattern.yarnWeight == YarnTypes.unknown.id ? "Unknown" : pattern.yarnWeight)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text("Stitches: ")
                        .font(.headline) +
                    Text(" \(pattern.stitches == "" ? "Not specified" : pattern.stitches)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    let link = "[Visit](\(pattern.patternUrl))"
                    
                    pattern.patternUrl == ""
                    ? Text("Pattern Link: ")
                        .font(.headline) + Text("Not specified")
                    : Text("Pattern Link: ")
                        .font(.headline) + Text(.init(link))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Instructions:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(pattern.instructions)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Notes:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(pattern.notes)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            
            Button(action: {
                let thawedPattern = pattern.thaw()
                if thawedPattern!.isInvalidated == false { //ensure it's a valid item
                    
                    let thawedRealm = thawedPattern!.realm! //get the realm it belongs to
                    
                    try! thawedRealm.write {
                        thawedRealm.delete(thawedPattern!)
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Delete Pattern")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editPattern = true
                } label: {
                    Text("Edit")
                }
                .padding()
            }
        })
        .sheet(isPresented: $editPattern) {
            EditPatternView(pattern: pattern)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView(pattern: Pattern())
    }
}
