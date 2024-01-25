//
//  YarnViewModel.swift
//  CrochetCompanion
//
//  Created by Alina Tariq on 2024-01-16.
//

import Foundation
import RealmSwift
import SwiftUI

struct YarnViewModel: DynamicProperty {
    @ObservedResults(Yarn.self) var yarnCollection
    
    public func addYarn(name: String, imageUrl: String, brand: String, colour: String, colourFamily: ColourTypes, yarnWeight: YarnTypes, notes: String, dyeLot: String, qty: Int) {
        
        let newYarn = Yarn()
        newYarn.brand = brand
        newYarn.name = name
        newYarn.colour = colour
        newYarn.colourFamily = colourFamily.rawValue
        newYarn.yarnWeight = yarnWeight.rawValue
        newYarn.dyeLot = dyeLot
        newYarn.imageUrl = imageUrl
        newYarn.qty = qty
        newYarn.notes = notes
        
        $yarnCollection.append(newYarn)
    }
    
    public func editYarn(yarn: Yarn, name: String, brand: String, colour: String, colourFamily: ColourTypes, yarnWeight: YarnTypes, dyeLot: String, imageUrl: String, qty: Int, notes: String) {
        let thawedYarn = yarn.thaw()
        if thawedYarn!.isInvalidated == false {
            // get the object's realm
            let thawedRealm = thawedYarn!.realm!
            
            try! thawedRealm.write {
                thawedYarn!.brand = brand
                thawedYarn!.name = name
                thawedYarn!.colour = colour
                thawedYarn!.colourFamily = colourFamily.rawValue
                thawedYarn!.yarnWeight = yarnWeight.rawValue
                thawedYarn!.dyeLot = dyeLot
                thawedYarn!.imageUrl = imageUrl
                thawedYarn!.qty = qty
                thawedYarn!.notes = notes
            }
        }
    }
    
    public func returnCount() -> Int {
        return yarnCollection.count
    }
    
    public func returnYarns() -> Results<Yarn> {
        return yarnCollection
    }
    
    public func deleteYarn(yarn: Yarn) {
        let thawedYarn = yarn.thaw()
        if thawedYarn!.isInvalidated == false { //ensure it's a valid item
            
            let thawedRealm = thawedYarn!.realm! //get the realm it belongs to
            
            try! thawedRealm.write {
                thawedRealm.delete(thawedYarn!)
            }
        }
    }
}
