//
//  ProjectModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation

// TODO: add a progress tracker
struct Project: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String // TODO: see PatternModel
    let yarn: String // TODO: support populating from yarn collection
    let stitches: String // TODO: see PatternModel
    let patternUrl: String
    let pattern: String
    let notes: String
}


