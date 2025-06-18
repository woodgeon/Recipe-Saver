//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            NavigationView {
                Text("버전 정보: v1.0.0")
                    .navigationTitle(Text("설정"))
            }
            .navigationViewStyle(.stack)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
