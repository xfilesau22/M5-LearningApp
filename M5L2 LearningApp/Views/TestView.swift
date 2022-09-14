//
//  TestView.swift
//  M5L2 LearningApp
//  M5L12 Coding....
//
//  Created by Alan Dinon on 30/8/2022.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex:Int?
    @State var submitted = false
    @State var numberCorrect = 0
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading){
                
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers:
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            // Select answer button
                            Button {
                                // Track the selected index
                                selectedAnswerIndex = index
                            } label: {
                                ZStack{
                                    // Answer selected and not submitted
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    // Answer submitted
                                    else {
                                        // Answer has been submitted.
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            
                                            // User has selected the correct answer
                                            // Show a green background
                                            RectangleCard(color:Color.green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            
                                            // User has selected the wrong answer
                                            // Show a red background
                                            RectangleCard(color:Color.red)
                                                .frame(height: 48)
                                        }
                                        else if index == model.currentQuestion!.correctIndex {
                                            // This button is the correct answer
                                            // Show a green background
                                            RectangleCard(color:Color.green)
                                                .frame(height: 48)
                                        }
                                        else {
                                            // Default color unselected buttons
                                            RectangleCard(color:Color.white)
                                                .frame(height: 48)
                                            
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                            }
                            .disabled(submitted)
                        }
                    }
                    .accentColor(Color.black)
                    .padding()
                }
                // Submit Button: to submit answer, complete the quiz
                Button {
                    
                    // Check if the answer has been submitted
                    if submitted == true {
                        // Answer has already been submitted, move to the next question
                        model.nextQuestion()
                        submitted = false
                        selectedAnswerIndex = nil
                    }
                    else {
                        // Submit the answer, change the submitted state to true
                        submitted = true
                        
                        // Check The answer and increment the counter if the answer is correct.
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numberCorrect += 1
                        }
                    }
                    
                } label: {
                    // Button Rectangle
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text(buttonText)
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
    }
    
    var buttonText: String {
        
        // Check if answer has been submitted
        if submitted == true {
            
            // Check if last question
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                
                // This is the last question
                return "Finish"
            }
            else {
                // There is a next question
                return "Next"
            }
        }
        else {
            // Answer not submitted
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
