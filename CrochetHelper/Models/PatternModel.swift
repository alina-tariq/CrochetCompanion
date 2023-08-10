//
//  PatternModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-09.
//

import Foundation

enum HookSizes: String {
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

struct Pattern: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let hook: HookSizes.RawValue
    let stitches: String
    let url: String
    let pattern: String
    let notes: String
}
