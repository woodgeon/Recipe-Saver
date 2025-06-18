//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
    @StateObject var recipeVM = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeVM)
        }
    }
}
