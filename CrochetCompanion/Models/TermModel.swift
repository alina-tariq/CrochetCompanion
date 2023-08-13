//
//  GlossaryTermModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation
import RealmSwift

class Term: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var instructions: String
    // TODO: use local images
    @Persisted var imageUrl: String
    // TODO: embed video in app for viewing?
    @Persisted var videoUrl: String
}
