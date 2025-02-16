//
//  Router.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//
import Combine
import SwiftUI

@MainActor
final class Router: ObservableObject {
    // MARK: - Public Properties
    @Published var path = NavigationPath()
    enum Route: Hashable {
        case firstView
        case secondView
        case thirdView
        case storiesView
        case showStory(story: Story)
    }
    // MARK: - Public Methods
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .firstView:
            FirstView()
        case .secondView:
            SecondView()
        case .thirdView:
            ThirdView()
        case .storiesView:
            StoriesView()
        case let .showStory(story):
            StoryDetailView(story: story)
        }
    }
    
    @inlinable
    @inline(__always)
    func push(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    @inlinable
    @inline(__always)
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    @inlinable
    @inline(__always)
    func backToRoot() {
        path.removeLast(path.count)
    }
}
