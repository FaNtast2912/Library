//
//  ContentView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack {
            Text("Root view")
            Button(action: {
                router.push(.firstView)
            }) {
                Text("Go to first view")
            }
            Button(action: {
                router.push(.storiesView)
            }) {
                Text("Go to Scroll view")
            }
        }
    }
}

#Preview {
    RouterView {
        ContentView()
    }
}
