//
//  ContentView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var router = Router.shared
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Text("Root view")
                Button(action: {
                    router.showView(view: .firstView)
                }) {
                    Text("Go to first view")
                }
                Button(action: {
                    router.showView(view: .scrollView)
                }) {
                    Text("Go to Scroll view")
                }
            }
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .firstView:
                    FirstView()
                case .secondView:
                    SecondView()
                case .thirdView:
                    ThirdView()
                case .scrollView:
                    StoriesView()
                case .showStory(let imageName):
                    StoryDetailView(imageName: imageName)
                }
            })
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
