//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    var category: Category

    // Computed property
    var recipes: [Recipe] {
        return recipeVM.recipes.filter { $0.category == category.rawValue }
    }

    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
                .navigationTitle(category.rawValue)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.dessert)
            .environmentObject(RecipeViewModel())
    }
}
