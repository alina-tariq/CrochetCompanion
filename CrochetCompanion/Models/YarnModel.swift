//
//  YarnModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation
import RealmSwift

enum ColourTypes: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case unknown = "Choose a colour family"
    case black = "Black"
    case blue = "Blue"
    case brown = "Brown"
    case green = "Green"
    case grey = "Grey"
    case multicolour = "Multicolour"
    case orange = "Orange"
    case pink = "Pink"
    case purple = "Purple"
    case red = "Red"
    case white = "White"
    case yellow = "Yellow"
}

class Yarn: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var brand: String
    @Persisted var name: String
    @Persisted var colour: String
    // TODO: allow multiple colour family
    @Persisted var colourFamily: ColourTypes.RawValue
    @Persisted var yarnWeight: YarnTypes.RawValue
    @Persisted var dyeLot: String
    @Persisted var imageUrl: String
    @Persisted var qty: Int 
    @Persisted var notes: String
}
