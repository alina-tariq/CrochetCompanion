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
    @Persisted var imageUrl: String = "https://images.unsplash.com/photo-1550376026-7375b92bb318?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1008&q=80"
    @Persisted var qty: Int 
    @Persisted var notes: String
}
