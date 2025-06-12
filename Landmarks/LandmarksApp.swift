//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by admin on 10/06/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData  = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
