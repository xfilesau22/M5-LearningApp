//
//  TestResultView.swift
//  M5L2 LearningApp
//  M5L13 ....
//
//  Created by Alan Dinon on 15/9/2022.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model: ContentModel
    var numCorrect: Int
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        if pct > 0.7 {
            return "Awesome"
        }
        else if pct > 0.4 {
            return "Doing Great"
        }
        else {
            return "Keep Learning"
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(resultHeading)
                .font(.title)
            Spacer()
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0)")
            
            Button {
                // Send the user back to the home view
                model.currentTestSelected = nil
                
            } label: {
                ZStack{
                    RectangleCard(color: .green)
                        .frame(height:48)
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 0)
    }
}
