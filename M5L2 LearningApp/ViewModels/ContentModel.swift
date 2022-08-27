//
//  ContentModel.swift
//  M5L2 LearningApp
//  M5L8....
//
//  Created by Alan Dinon on 26/4/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of Modules
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current Lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    // Current lesson explanation (initialize as an empty string)
    @Published var lessonDescription = NSAttributedString()
    
    // HTML Styling Data Property
    var styleData: Data?
    
    // Current selected content and test
    @Published var currentContentSelected: Int?
    
    // Initilizer for getLocalData
    init(){
        
        getLocalData()
    }
    
    // MARK: - Data methods
    
    func getLocalData() {
        
        // Get a url to the json file.
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // read file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // parse the data object
            let decoder = JSONDecoder()
            
            let modules = try decoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules into property modules
            self.modules = modules
        }
        catch {
            // Handle error/log error
            print(error)
        }
        // Parse the Style Data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            
            // Handle style parsing error
            print(error)
        }
    }
    
    // MARK: Module Navigation Methods
    
    func beginModule(_ moduleid: Int) {
        
        // Find the index for this module id.
        for index in 0..<modules.count{
            if modules[index].id == moduleid{
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module.
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        
        // Check the lesson index is within the range of module lessons.
        if lessonIndex < currentModule!.content.lessons.count {
            
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        // Set the current lesson and description
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson(){
        // Advance the lesson index
        currentLessonIndex += 1
        
        // Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            // Set the currentLesson property and the lessonDescription property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
            
        } else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool {
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    // MARK: Code Styling
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add the styling data
        if styleData != nil {
            data.append(styleData!)
        }
        // Add the html data
        data.append(Data(htmlString.utf8))
        
        // Convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            
            resultString = attributedString
        }
        return resultString
    }
}
