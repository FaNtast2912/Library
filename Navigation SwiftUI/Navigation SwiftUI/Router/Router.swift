//
//  Router.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//
import Combine

enum Route: Hashable {
    case firstView
    case secondView
    case thirdView
    case scrollView
    case showStory(storyName: String)
}

final class Router: ObservableObject {
    static let shared = Router()

    @Published var path = [Route]()
    
    private init() {}
    
    func showView(view: Route) {
        path.append(view)
    }
    
    func backToRoot() {
        path.removeAll()
    }
    
    func back() {
        path.removeLast()
    }
}
