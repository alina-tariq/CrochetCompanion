//
//  PatternViewModel.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import Foundation
import Combine
import RealmSwift

class PatternViewModel: ObservableObject {
    @Published var patterns: [Pattern] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        let realm = try? Realm()
        
        if let patterns = realm?.objects(Pattern.self) {
            self.patterns = Array(patterns)
        } else {
            try? realm?.write({
                let newPatternClass = Pattern()
                realm?.add(newPatternClass)
            })
        }
            
    }
}
