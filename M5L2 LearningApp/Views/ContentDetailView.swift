//
//  ContentDetailView.swift
//  M5L2 LearningApp
//  M5L9....
//
//  Created by Alan Dinon on 15/8/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            // Only show a video if we get a valid url.
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            // Description
            CodeTextView()
            
            // Next Lesson Button button only if there is a next lesson
            if model.hasNextLesson(){
                Button {
                    // Advance the lesson
                    model.nextLesson()
                } label: {
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            } else {  // no next button, add complete button to return navigation to home view
                
                Button {
                    // Return link to HomeView
                    model.currentContentSelected = nil
                } label: {
                    ZStack{
                        RectangleCard(color: Color.red)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
