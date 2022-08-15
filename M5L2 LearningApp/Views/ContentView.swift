//
//  ContentView.swift
//  M5L2 LearningApp
//  M5L6....
//
//  Created by Alan Dinon on 23/7/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            LazyVStack{
                
                // Confirm that currentModule is set, and not nil.
                if model.currentModule != nil{
                    
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        ContentViewRow(index: index)
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
