//
//  CrochetHelperApp.swift
//  CrochetHelper
//
//  Created by Alina Tariq on 2023-08-09.
//

import SwiftUI

@main
struct CrochetHelperApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
