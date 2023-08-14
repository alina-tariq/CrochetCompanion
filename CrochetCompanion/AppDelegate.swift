//
//  AppDelegate.swift
//  CrochetCompanion
//
//  Created by Alina Tariq on 2023-08-13.
//

import Foundation
import UIKit
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setup()
        return true
    }
    
    func setup() {
        let bundleUrl = Bundle.main.url(forResource: "default", withExtension: "realm")!
        let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
        let defaultParentURL = defaultURL.deletingLastPathComponent()
        let fileName = "default"
        let destinationUrl = defaultParentURL.appendingPathComponent(fileName + ".realm")
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: destinationUrl.path) {
            try! fileManager.copyItem(at: bundleUrl, to: destinationUrl)
            print("Pre-populated database created")
        } else {
            print("Database already exists")
        }
        
        print(destinationUrl)
        
    }
}
