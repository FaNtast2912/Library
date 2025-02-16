//
//  FirstView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct FirstView: View {
    let router = Router.shared
    
    var body: some View {
        VStack {
            Text("first view")
            Button(action: {
                router.showView(view: .secondView)
            }) {
                Text("Go to second view")
            }
        }
        .padding()
    }
}

#Preview {
    FirstView()
}
