//
//  FirstView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Text("first view")
            Button(action: {
                router.push(.secondView)
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
