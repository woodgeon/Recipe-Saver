//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false

    var body: some View {
        NavigationView {
            Button("여기를 눌러서 레시피를 추가하세요!") {
                showAddRecipe = true
            }
            .navigationTitle("새로운 레시피")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
