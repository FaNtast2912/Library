//
//  RouterView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct RouterView<Content: View>: View {
    // MARK: - Private Properties
    @ObservedObject private var router = Router()
    private let content: Content
    
    // MARK: - Initialisers
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) {
                    router.view(for: $0)
                }
        }
        .environmentObject(router)
    }
    
}

#Preview {
    RouterView() {
        VStack{
        }
    }
}

// MARK: - Расширение чтобы свайп работал
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
