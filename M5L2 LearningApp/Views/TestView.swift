//
//  TestView.swift
//  M5L2 LearningApp
//
//  Created by Alan Dinon on 30/8/2022.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack{
                
                // Question Number
                
                // Question
                
                // Answers:
                
                // Button to submit answer, advance to next question
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
