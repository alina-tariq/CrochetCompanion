//
//  YarnViewModel.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import Foundation
import Combine
import RealmSwift

class YarnViewModel: ObservableObject {
    @Published var yarns: [Yarn] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        let realm = try? Realm()
        
        if let yarns = realm?.objects(Yarn.self) {
            self.yarns = Array(yarns)
        } else {
            try? realm?.write({
                let newYarnClass = Yarn()
                realm?.add(newYarnClass)
            })
        }
            
    }
}
