//
//  RectangleCard.swift
//  M5L2 LearningApp
//  M5L12 Coding....
//
//  Created by Alan Dinon on 27/8/2022.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
