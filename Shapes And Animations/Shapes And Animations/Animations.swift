//
//  Animations.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct Animations: View {
    let size: CGFloat = 120
    @State var positionState = CGSize.zero
    @State var rotationAngle: Double = 0
    @State var isRotating = false
    let initialScale: CGFloat = 0.2
    let numberOfCircles = 6
    var body: some View {
        ZStack {
            makeCircles(for: numberOfCircles)
        }
        .offset(x: positionState.width, y: positionState.height)
        .gesture (
            DragGesture()
                .onChanged { value in
                    positionState = value.translation
                }
            ) 
        .scaleEffect(CGSize(width: initialScale + rotationAngle / 360,
                            height: initialScale + rotationAngle / 360))
        .frame(width: size, height: size)
        .rotationEffect(.degrees(rotationAngle))
        .animation(
            .linear(duration: 2)
            .repeatForever(autoreverses: true),
            value: rotationAngle)
        .onTapGesture {
           rotationAngle = 360
        }
    }
    
    @ViewBuilder
    func makeCircles(for number: Int) -> some View {
        ForEach((0...number-1), id: \.self) { value in
            Circle()
                .fill(Color.teal.opacity(0.5))
                .offset(y: size/2)
                .rotationEffect(Angle(degrees: Double(value * 60)))
        }
    }
}

#Preview {
    Animations()
}
