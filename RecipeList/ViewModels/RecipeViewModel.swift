//
//  RecipeViewModel.swift
//  RecipeList
//
//  Created by DEV-BC on 12/7/22.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData() //this will return a list of recipes
    }
}
