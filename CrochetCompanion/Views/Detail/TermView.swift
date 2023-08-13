//
//  TermView.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import SwiftUI
import YouTubePlayerKit

struct TermView: View {
    var term: GlossaryTerm
    @State private var editTerm = false
    @State private var goBack = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Text(term.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
            
            if (term.imageUrl != "") {
                AsyncImage(url: URL(string: term.imageUrl)) { image in image
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
                Text("Instructions:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text(term.instructions)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                let videoLink = YouTubePlayer(source: .url(term.videoUrl))
                
                if (term.videoUrl != "") {
                    Text("Video Instructions:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                    
                    YouTubePlayerView(videoLink, placeholderOverlay: { ProgressView() })
                        .frame(height: 220)
                        .background(Color(.systemBackground))
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 46, x: 0, y: 15)
                }
                
            }
            .padding(.horizontal)
            
            Button(action: {
                let thawedPattern = term.thaw()
                if thawedPattern!.isInvalidated == false { //ensure it's a valid item
                    
                    let thawedRealm = thawedPattern!.realm! //get the realm it belongs to
                    
                    try! thawedRealm.write {
                        thawedRealm.delete(thawedPattern!)
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Delete Term")
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editTerm = true
                } label: {
                    Text("Edit")
                }
                .padding()
            }
        })
        .sheet(isPresented: $editTerm) {
            EditTermView(term: term)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TermView_Previews: PreviewProvider {
    static var previews: some View {
        TermView(term: GlossaryTerm())
    }
}
