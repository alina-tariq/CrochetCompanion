//
//  GlossaryTermModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation
import RealmSwift

class GlossaryTerm: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var instructions: String
    // TODO: use local images
    @Persisted var imageUrl: String
    // TODO: embed video in app for viewing?
    @Persisted var videoUrl: String
}
