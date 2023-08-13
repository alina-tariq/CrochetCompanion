//
//  PatternModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import Foundation
import RealmSwift

enum HookSizes: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case unknown = "Choose a hook size"
    case b = "B/1 - 2.25 mm"
    case c = "C/2 - 2.75 mm"
    case d = "D/3 - 3.25 mm"
    case e = "E/4 - 3.5 mm"
    case f = "F/5 - 3.75 mm"
    case g = "G/6 - 4 mm"
    case h = "H/8 - 5 mm"
    case i = "I/9 - 5.5 mm"
    case j = "J/10 - 6 mm"
    case k = "K/10.5 - 6.5 mm"
    case l = "L/11 - 8 mm"
    case m = "M/13 - 9 mm"
    case n = "N/15 - 10 mm"
}

enum YarnTypes: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case unknown = "Choose a yarn weight"
    case lace = "0 - Lace"
    case superFine = "1 - Super Fine"
    case fine = "2 - Fine"
    case light = "3 - Light"
    case medium = "4 - Medium"
    case bulky = "5 - Bulky"
    case superBulky = "6 - Super Bulky"
    case jumbo = "7 - Jumbo"
}

// TODO: consider changing to a class if adding a start project from pattern button

class Pattern: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    // TODO: use local images
    @Persisted var imageUrl: String
    // TODO: support multiple hook sizes, allow filtering
    @Persisted var hook: HookSizes.RawValue = ""
    // TODO: support multiple weights, allow filtering
    @Persisted var yarnWeight: YarnTypes.RawValue = ""
    // TODO: populate from glossary terms, connect to definition
    @Persisted var stitches: String
    @Persisted var patternUrl: String
    @Persisted var instructions: String
    @Persisted var notes: String
}
