//
//  ProjectModel.swift
//  Crochet Helper
//
//  Created by Alina Tariq on 2023-08-10.
//

import Foundation

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let hook: HookSizes.RawValue
    let yarn: String
    let stitches: String
    let url: String
    let pattern: String
    let notes: String
}


