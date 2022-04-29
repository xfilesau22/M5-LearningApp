//
//  M5L2_LearningApp.swift
//  M5L2 LearningApp
//  M5L3 Coding....
//  Created by Alan Dinon on 26/4/2022.
//

import SwiftUI

@main
struct M5L2_LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
