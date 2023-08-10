//
//  YarnModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation

struct Yarn: Identifiable {
    let id = UUID()
    let brand: String
    let name: String
    let colour: String
    let image: String
    let qty: Int
    let notes: String
}
