//
//  ContentModel.swift
//  M5L2 LearningApp
//  M5L6....
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
    
    var styleData: Data?
    
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
}
