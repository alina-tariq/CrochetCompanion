//
//  ProjectViewModel.swift
//  CrochetCompanion
//
//  Created by Alina Tariq on 2024-01-16.
//

import Foundation
import RealmSwift
import SwiftUI

struct ProjectViewModel: DynamicProperty {
    @ObservedResults(Project.self) var projects
    
    public func addProject(name: String, imageUrl: String, stitches: String, patternUrl: String, instructions: String, yarn: String, notes: String) {

        let newProject = Project()
        newProject.name = name
        newProject.imageUrl = imageUrl
        newProject.yarn = yarn
        newProject.stitches = stitches
        newProject.patternUrl = patternUrl
        newProject.instructions = instructions
        newProject.notes = notes
        
        $projects.append(newProject)
    }
    
    public func editProject(project: Project, name: String, imageUrl: String, yarn: String, stitches: String, patternUrl: String, notes: String, finished: Bool, instructions: String) {
        let thawedProject = project.thaw()
        if thawedProject!.isInvalidated == false {
            // get the object's realm
            let thawedRealm = thawedProject!.realm!
            
            try! thawedRealm.write {
                thawedProject!.name = name
                thawedProject!.imageUrl = imageUrl
                thawedProject!.yarn = yarn
                thawedProject!.stitches = stitches
                thawedProject!.patternUrl = patternUrl
                thawedProject!.finished = finished
                thawedProject!.instructions = instructions
                thawedProject!.notes = notes
            }
        }
    }
    
    public func returnCount() -> Int {
        return projects.count
    }
    
    public func returnProjects() -> Results<Project> {
        return projects
    }
    
    public func deleteProject(project: Project) {
        let thawedProject = project.thaw()
        if thawedProject!.isInvalidated == false { //ensure it's a valid item
            
            let thawedRealm = thawedProject!.realm! //get the realm it belongs to
            
            try! thawedRealm.write {
                thawedRealm.delete(thawedProject!)
            }
        }
    }
}
