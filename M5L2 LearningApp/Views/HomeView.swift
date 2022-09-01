//
//  HomeView.swift
//  M5L2 LearningApp
//  M5L10 Coding....
//  Created by Alan Dinon on 26/4/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){ module in
                            VStack(spacing: 20){
                                NavigationLink(destination:
                                                ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)}),
                                               tag: module.id,
                                               selection: $model.currentContentSelected,
                                               label: {
                                    // Learning Card
                                    HomeViewRow(image: module.content.image, tile: module.category, description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: "\(module.content.time)")})
                                
                                NavigationLink(destination:
                                                TestView()
                                    .onAppear(perform: {model.beginTest(module.id)}),
                                               tag: module.id,
                                               selection: $model.currentTestSelected,
                                               label: {
                                    // Test Card
                                    HomeViewRow(image: module.test.image, tile: module.category, description: module.test.description, count: "\(module.test.questions.count) Questions", time: "\(module.test.time)")})
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
