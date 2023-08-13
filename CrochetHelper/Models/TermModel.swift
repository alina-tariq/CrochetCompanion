//
//  GlossaryTermModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation
import RealmSwift

class Term: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var instructions: String
    // TODO: use local images
    @Persisted var imageUrl: String
    @Persisted var videoUrl: String
    
    convenience init(name: String, instructions: String, imageUrl: String, videoUrl: String) {
        self.init()
        self.name = name
        self.instructions = instructions
        self.imageUrl = imageUrl
        self.videoUrl = videoUrl
    }
}
