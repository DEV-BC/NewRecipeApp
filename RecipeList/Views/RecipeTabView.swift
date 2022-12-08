//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by DEV-BC on 12/8/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured View")
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
            ContentView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
