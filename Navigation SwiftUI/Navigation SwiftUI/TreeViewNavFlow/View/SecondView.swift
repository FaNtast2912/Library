//
//  SecondView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Text("Second view")
            Button(action: {
                router.push(.thirdView)
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
