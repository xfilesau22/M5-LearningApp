//
//  ContentDetailView.swift
//  M5L2 LearningApp
//
//  Created by Alan Dinon on 15/8/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        
        
        VStack{
            VideoPlayer(player: AVPlayer(url: URL))
            Text("Next Lesson:")
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
