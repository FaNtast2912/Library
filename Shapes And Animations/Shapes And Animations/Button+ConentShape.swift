//
//  Button+ConentShape.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct Button_ConentShape: View {
    var body: some View {
        VStack {
            Button  {
                print("Удачное нажатие!")
            } label: {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Привет, Практикум!")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .contentShape(Circle())
            .background(.green)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
        }
        .padding()
    }
}

#Preview {
    Button_ConentShape()
}
