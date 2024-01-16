//
//  TermViewModel.swift
//  CrochetCompanion
//
//  Created by Alina Tariq on 2024-01-16.
//

import Foundation
import RealmSwift
import SwiftUI

struct TermViewModel: DynamicProperty {
    @ObservedResults(Term.self, sortDescriptor: SortDescriptor(keyPath: "name", ascending: true)) var terms
    
    public func addTerm(name: String, imageUrl: String, videoUrl: String, instructions: String) {
        
        let newTerm = Term()
        newTerm.name = name
        newTerm.instructions = instructions
        newTerm.imageUrl = imageUrl
        newTerm.videoUrl = videoUrl
        
        $terms.append(newTerm)
    }
    
    public func editTerm(term: Term, name: String, instructions: String, imageUrl: String, videoUrl: String) {
        let thawedTerm = term.thaw()
        if thawedTerm!.isInvalidated == false {
            // get the object's realm
            let thawedRealm = thawedTerm!.realm!
            
            try! thawedRealm.write {
                thawedTerm!.name = name
                thawedTerm!.instructions = instructions
                thawedTerm!.imageUrl = imageUrl
                thawedTerm!.videoUrl = videoUrl
            }
        }
    }
    
    public func returnCount() -> Int {
        return terms.count
    }
    
    public func returnTerms() -> Results<Term> {
        return terms
    }
    
    public func deleteTerm(term: Term) {
        let thawedTerm = term.thaw()
        if thawedTerm!.isInvalidated == false { //ensure it's a valid item
            
            let thawedRealm = thawedTerm!.realm! //get the realm it belongs to
            
            try! thawedRealm.write {
                thawedRealm.delete(thawedTerm!)
            }
        }
    }
}
