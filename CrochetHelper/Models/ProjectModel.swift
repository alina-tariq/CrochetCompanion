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
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    // TODO: see PatternModel
    @Persisted var imageUrl: String = "https://images.unsplash.com/photo-1619234711431-644a9d28d6ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=898&q=80"
    // TODO: support populating from yarn collection
    @Persisted var yarn: String
    // TODO: see PatternModel
    @Persisted var stitches: String
    @Persisted var patternUrl: String
    @Persisted var instructions: String
    @Persisted var notes: String
    @Persisted var finished: Bool = false
}


