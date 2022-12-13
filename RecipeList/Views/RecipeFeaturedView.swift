//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by DEV-BC on 12/13/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}



/*
    OBSERVED OBJECT VS ENVIRONMENT OBJECT
    
    with observed object - we created an instance of the RecipeModel which goes out and gets the local data and we observe any changes made to it and it updates the view
    the PROBLEM is when you want to pass data through multiple views, you can't use OBSERVED OBJECT because you technically can create another instance of the model and make it an observed object but since the RecipeViewModel gets the local data from its init method, you are essentially bringing in the same data which is not needed since you already got the data into the project from creating an instance of RecipeViewModel in the ContentView
 
 
    Environment Object - create the object and pass in instance of the RecipeViewModel in the View at the top of the View Heirarchy...in this case the Featured View since its the entry point of the app and in each subview, just create a property of the RecipeViewModel and all the data will be automatically passed down through that property
 
    always add the .environmentObject at the top of the view heirarchy
 */
