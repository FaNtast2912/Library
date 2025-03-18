//
//  ContentView.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State var scale: CGFloat = 1.0 // тут будем хранить коэффициент увеличения
    @State var positionState = CGSize.zero
    var body: some View {
        VStack {
                Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.blue)
            Text("Привет, Практикум!")
        }
        .offset(x: positionState.width, y: positionState.height)
        .gesture (
            DragGesture()
                .onChanged { value in
                    positionState = value.translation
                }
            )
        .scaleEffect(scale)
        .gesture(
            MagnificationGesture()
                .onChanged { value in
                    self.scale = value.magnitude
                }
            )
        .padding()
    }
}

#Preview {
    ContentView()
}
