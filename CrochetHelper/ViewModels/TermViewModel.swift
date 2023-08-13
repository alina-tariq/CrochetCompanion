//
//  GlossaryTermViewModel.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import Foundation
import Combine
import RealmSwift

class TermViewModel: ObservableObject {
    @Published var terms: [Term] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        let realm = try? Realm()
        
        if let terms = realm?.objects(Term.self) {
            self.terms = Array(terms)
        } else {
            try? realm?.write({
                let newTermClass = Term()
                realm?.add(newTermClass)
            })
        }
            
    }
}


