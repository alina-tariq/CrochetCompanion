//
//  YarnModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation

enum ColourTypes: String, CaseIterable, Identifiable {
    var id: String {
        return rawValue.capitalized
        
    }
    
    case black
    case blue
    case brown
    case green
    case grey
    case multicolour
    case orange
    case pink
    case purple
    case red
    case white
    case yellow
}

struct Yarn: Identifiable {
    let id = UUID()
    let brand: String
    let name: String
    let colourName: String
    let commonColour: ColourTypes.RawValue
    let yarnWeight: YarnTypes.RawValue
    let dyeLot: String
    let imageUrl: String
    let qty: Int
    let notes: String
}
