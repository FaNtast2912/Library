//
//  SerialAnimations.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct SerialAnimations: View {
    @State var size: CGFloat = 150
    @State var animate: Bool = false
    
    var body: some View {
        Text("Привет,\nПрактикум!")
            .multilineTextAlignment(.center)
            .font(.title)
            .phaseAnimator(AnimationPhase.allCases) { content, phase in
                content
                    .foregroundStyle(phase.color)
                    .rotationEffect(phase.rotation)
                    .offset(y:phase.offset)
            } animation: { phase in
                phase.animation
            }
    }
}

#Preview {
    SerialAnimations()
}


enum AnimationPhase: CaseIterable {
    case start, middle, end
    
    var rotation: Angle {
        switch self {
        case .start: .degrees(-15)
        case .middle: .degrees(15)
        case .end: .zero
        }
    }
    var color: Color {
        switch self {
        case .start: .purple
        case .middle: .orange
        case .end: .teal
        }
    }
    var offset: CGFloat {
        switch self {
        case .start: -20
        case .middle: 0
        case .end: 20
        }
    }
    var animation: Animation {
        switch self {
        case .start: .easeIn
        case .middle: .linear
        case .end: .easeOut
        }
    }
}
