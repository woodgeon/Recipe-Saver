//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    @State private var lastSavedRecipe: Recipe? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("이름")) {
                    TextField("음식 이름", text: $name)
                }
                
                Section(header: Text("종류")) {
                    Picker("음식 종류", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("설명")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("재료")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("조리법")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    Button {
                        let recipe = saveRecipe()
                        print("저장된 레시피: \(recipe.name)")
                        lastSavedRecipe = recipe
                        navigateToRecipe = true
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                    .background(
                        NavigationLink(
                            destination: lastSavedRecipe.map { recipe in
                                RecipeView(recipe: recipe)
                                    .navigationBarBackButtonHidden(true)
                            },
                            isActive: $navigateToRecipe,
                            label: {
                                EmptyView()
                            }
                        )
                    )
                }
            })
            .navigationTitle("새로운 레시피")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}

extension AddRecipeView {
    private func saveRecipe() -> Recipe {
        let now = Date()
        
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        
        let datePublished = dateFomatter.string(from: now)
        print("생성된 날짜: \(datePublished)")
        
        let recipe = Recipe(
            name: name,
            image: "https://source.unsplash.com/400x300/?food",
            description: description,
            ingredients: ingredients,
            directions: directions,
            category: selectedCategory.rawValue,
            datePublished: datePublished,
            url: ""
        )
        
        print("생성된 레시피: \(recipe)")
        
        recipeVM.addRecipe(recipe: recipe)
        print("ViewModel 내 recipes 개수: \(recipeVM.recipes.count)")
        
        return recipe
    }
}
