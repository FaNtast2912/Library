//
//  SwiftUIView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct ThirdView: View {
    let router = Router.shared
    
    var body: some View {
        VStack {
            Text("Last view")
            Button(action: {
                router.backToRoot()
            }) {
                Text("Go to root")
            }
        }
        .padding()
    }
}

#Preview {
    ThirdView()
}
