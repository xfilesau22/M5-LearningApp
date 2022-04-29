//
//  ContentModel.swift
//  M5L2 LearningApp
//
//  Created by Alan Dinon on 26/4/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init(){
        
        getLocalData()
    }
    
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
}
