//
//  ProjectViewModel.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-12.
//

import Foundation
import Combine
import RealmSwift

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        let realm = try? Realm()
        
        if let projects = realm?.objects(Project.self) {
            self.projects = Array(projects)
        } else {
            try? realm?.write({
                let newProjectClass = Project()
                realm?.add(newProjectClass)
            })
        }
            
    }
}

