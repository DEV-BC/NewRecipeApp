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
        
        VStack(alignment: .leading) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            GeometryReader { geo in
                //Create a Card view
                TabView {
                    //Loop through each recipe
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        
                        //Only show those that should be featured
                        if model.recipes[index].featured == true {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                        
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.33), radius: 10, x: -5, y: 5)
                           
                                
                        }
                    }
                } //this creates the swipe action. index display mode adds the dots.
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time: ")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}



/*
    OBSERVED OBJECT VS ENVIRONMENT OBJECT
    
    with observed object - we created an instance of the RecipeModel which goes out and gets the local data and we observe any changes made to it and it updates the view
    the PROBLEM is when you want to pass data through multiple views, you can't use OBSERVED OBJECT because you technically can create another instance of the model and make it an observed object but since the RecipeViewModel gets the local data from its init method, you are essentially bringing in the same data which is not needed since you already got the data into the project from creating an instance of RecipeViewModel in the ContentView
 
 
    Environment Object - create the object and pass in instance of the RecipeViewModel in the View at the top of the View Heirarchy...in this case the Featured View since its the entry point of the app and in each subview, just create a property of the RecipeViewModel and all the data will be automatically passed down through that property
 
    always add the .environmentObject at the top of the view heirarchy
 */
