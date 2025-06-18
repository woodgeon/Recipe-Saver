//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill() // fill로 고정하고
                    .frame(height: 300) // 높이 고정
                    .clipped()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))

            VStack(alignment: .center, spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 20) {
                    if !recipe.image.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.image.isEmpty {
                        VStack(spacing: 30) {
                            Text("재료")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    if !recipe.image.isEmpty {
                        VStack(spacing: 20) {
                            Text("조리법")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.all[0])
    }
}
