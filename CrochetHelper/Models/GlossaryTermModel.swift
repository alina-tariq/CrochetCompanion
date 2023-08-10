//
//  GlossaryTermModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation

struct GlossaryTerm: Identifiable {
    let id = UUID()
    let name: String
    let instructions: String
    let imageUrl: String
    let videoURL: String
}
