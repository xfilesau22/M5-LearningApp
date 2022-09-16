//
//  HomeViewRow.swift
//  M5L2 LearningApp
//  M5L13 Coding....
//  Created by Alan Dinon on 23/5/2022.
//

import SwiftUI

struct HomeViewRow: View {
    var image: String
    var tile: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 375, height: 175), contentMode: .fit)
            HStack{
                
                // Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116, alignment: .center)
                    .clipShape(Circle())
                Spacer()
                // Text
                VStack(alignment: .leading, spacing: 10){
                    
                    // Headline
                    Text(tile)
                        .bold()
                    
                    // Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 8))
                    
                    // Icons
                    HStack{
                        
                        // Number of Lessons/Questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.caption)
                        Spacer()
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 8))
                    }
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", tile: "Learn Swift", description: "some description", count: "10 Lessons", time: "2 Hours")
    }
}
