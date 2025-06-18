//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            NavigationView {
                Text("아직 아무 레시피도 즐겨찾기 하지 않았습니다.")
                    .padding()
                    .navigationTitle(Text("즐겨찾기"))
            }
            .navigationViewStyle(.stack)
        }
        .padding()
    }
}

#Preview {
    FavoritesView()
}
