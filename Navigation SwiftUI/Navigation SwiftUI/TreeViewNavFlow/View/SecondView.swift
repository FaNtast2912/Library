//
//  SecondView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct SecondView: View {
    let router = Router.shared
    
    var body: some View {
        VStack {
            Text("Second view")
            Button(action: {
                router.showView(view: .thirdView)
            }) {
                Text("Go to Third view")
            }
        }
        .padding()
    }
}

#Preview {
    SecondView()
}
