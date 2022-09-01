//
//  TestView.swift
//  M5L2 LearningApp
//  M5L10 Coding....
//
//  Created by Alan Dinon on 30/8/2022.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        // Add this view to allow for currentQuestion to be published, ProgressView() also fixes.
        //Text("Question ID: \(model.currentQuestion?.id ?? 00)")
        
        if model.currentQuestion != nil {
            
            VStack{
                
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                CodeTextView()
                    .padding()
                
                // Answers:
                
                
                // Button to submit answer, complete the quiz
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
