//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]

    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count >= 1 ? "개의 레시피" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    .padding(.leading, 20)

                Spacer()
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                    
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}
