//
//  TransitionAnimation.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var showNewView = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        showNewView.toggle()
                    }
                }
            if showNewView {
                Text("Привет, Практикум!")
                    .padding()
                    .transition(.rotate3D)
            }
            Spacer() // <- этот Spacer() отвечает за выравнивание
        }
        .frame(height: 100) // <- здесь мы зафиксировали высоту VStack
        .padding()
    }
}

#Preview {
    TransitionAnimation()
}


struct Effect3D: GeometryEffect {
    var value: Double
    var animatableData: Double {
        get { value }
        set { value = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationOffset = value
        let angleOfRotation = CGFloat(Angle(degrees: 95 * (1 - rotationOffset)).radians)
        var transform3D = CATransform3DIdentity
        transform3D = CATransform3DRotate(transform3D, angleOfRotation, 1, 0, 0)
        return ProjectionTransform(transform3D)
    }
}

extension AnyTransition {
    static var rotate3D: AnyTransition {
        get {
            AnyTransition.modifier(active: Effect3D(value: 0), identity: Effect3D(value: 1))
        }
    }
}
