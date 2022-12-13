//
//  ContentView.swift
//  RecipeList
//
//  Created by DEV-BC on 12/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: RecipeViewModel
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe), label: {
                    HStack(spacing: 20) {
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipe.name)
                        
                    }
                })
                    
                }
                .navigationTitle("All Recipes")
            }
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
    USE List when you want to loop through data but have it in a List format
    USE ForEach when you want to loop through data but have the ability to place it anywhere BUT it needs to be in an VStack or HStack
    You can not use a regular for in loop to loop through the data because you can not return a View. List and ForEach can return a View
    ScrollView is a container that scroll
    
 */
