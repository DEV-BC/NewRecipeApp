//
//  DataService.swift
//  RecipeList
//
//  Created by DEV-BC on 12/7/22.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {  //static is so we don't have to create an instance of the data service
        //parse json file
        let localDataPath = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //get a url path to the json file
        //check if path string is not nil, otherwise return empty recipe list
        guard let localDataPath = localDataPath else {
            return [Recipe]()
        }

        
        
        //create a url object
        let url = URL(fileURLWithPath: localDataPath)
        
        //create a json object
        
        do {
            let data = try Data(contentsOf: url)
            
            //decode data with json decoder
            let decoder = JSONDecoder()
            
            do {
               let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add unique ids
                for r in recipeData {
                    r.id = UUID()
                }
                //return the recipes
                return recipeData
            } catch {
                print(error)
            }
            
        } catch  {
            //error with getting data
            print(error)
        }
        
        
        
        return [Recipe]()
        
        
        
    }
}


/*
    Debug tip
    use po to print object in debug window...Ex. po r.name
 */
