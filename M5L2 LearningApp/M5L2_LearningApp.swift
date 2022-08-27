//
//  M5L2_LearningApp.swift
//  M5L2 LearningApp
//  M5L4 Coding....
//  M5L5 Coding....
//  M5L6 Coding....
//  M5L7 Coding....
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
