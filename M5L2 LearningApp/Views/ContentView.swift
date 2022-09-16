//
//  ContentView.swift
//  M5L2 LearningApp
//  M5L13 Coding....
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
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(perform: {model.beginLesson(index)})
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
            }
            .accentColor(Color.black)
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
