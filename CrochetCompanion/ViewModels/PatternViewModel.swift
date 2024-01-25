//
//  PatternViewModel.swift
//  CrochetCompanion
//
//  Created by Alina Tariq on 2024-01-16.
//

import Foundation
import RealmSwift
import SwiftUI

struct PatternViewModel: DynamicProperty {
    @ObservedResults(Pattern.self) var patterns
    
    public func addPattern(name: String, imageUrl: String, stitches: String, patternUrl: String, instructions: String, hook: HookSizes, yarnWeight: YarnTypes, notes: String) {
        
        let newPattern = Pattern()
        newPattern.name = name
        newPattern.imageUrl = imageUrl
        newPattern.instructions = instructions
        newPattern.stitches = stitches
        newPattern.patternUrl = patternUrl
        newPattern.notes = notes
        newPattern.hook = hook.id
        newPattern.yarnWeight = yarnWeight.id
        
        $patterns.append(newPattern)
    }
    
    public func editPattern(pattern: Pattern, name: String, imageUrl: String, instructions: String, stitches: String, patternUrl: String, notes: String, hook: HookSizes, yarnWeight: YarnTypes) {
        let thawedPattern = pattern.thaw()
        if thawedPattern!.isInvalidated == false {
            // get the object's realm
            let thawedRealm = thawedPattern!.realm!
            
            try! thawedRealm.write {
                thawedPattern!.name = name
                thawedPattern!.imageUrl = imageUrl
                thawedPattern!.instructions = instructions
                thawedPattern!.stitches = stitches
                thawedPattern!.patternUrl = patternUrl
                thawedPattern!.notes = notes
                thawedPattern!.hook = hook.id
                thawedPattern!.yarnWeight = yarnWeight.id
            }
        }
    }
    
    public func returnCount() -> Int {
        return patterns.count
    }
    
    public func returnPatterns() -> Results<Pattern> {
        return patterns
    }
    
    public func deletePattern(pattern: Pattern) {
        let thawedPattern = pattern.thaw()
        if thawedPattern!.isInvalidated == false { //ensure it's a valid item
            
            let thawedRealm = thawedPattern!.realm! //get the realm it belongs to
            
            try! thawedRealm.write {
                thawedRealm.delete(thawedPattern!)
            }
        }
    }
}
