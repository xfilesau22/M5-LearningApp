//
//  ContentViewRow.swift
//  M5L2 LearningApp
//  M5L6....
//
//  Created by Alan Dinon on 23/7/2022.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        
        // Display the Lesson Card
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66, alignment: .center)
            HStack(spacing:30){
                Text(String(index + 1))
                    .bold()
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }
            .padding()
        }
        .padding(.bottom, 8)
    }
}
