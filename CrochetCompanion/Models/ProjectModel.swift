//
//  ProjectModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation
import RealmSwift

// TODO: add progress tracker
class Project: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    // TODO: see PatternModel
    @Persisted var imageUrl: String
    // TODO: support populating from yarn collection
    @Persisted var yarn: String
    // TODO: see PatternModel
    @Persisted var stitches: String
    @Persisted var patternUrl: String
    @Persisted var instructions: String
    @Persisted var notes: String
    @Persisted var finished: Bool = false
}


