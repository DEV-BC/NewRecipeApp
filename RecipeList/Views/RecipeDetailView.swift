//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by DEV-BC on 12/8/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
        .navigationBarTitle(recipe.name)
    }

}
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //because we declared a property called recipe, we must set it in the preview or we will get "missing argument" error
        //create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeViewModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
