//
//  ComplicatedAnimation.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct ComplicatedAnimation: View {
    let size: CGFloat = 150
    @State var animate = false
    enum AnimationPhase: CaseIterable {
        case start, end
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .foregroundColor(.purple)
                .frame(width: size, height: size)
            
            Circle()
                .stroke(.purple, lineWidth: 5)
                .frame(width: size)
                .phaseAnimator(AnimationPhase.allCases, trigger: animate) { content, phase in
                    content
                        .opacity(phase == .start ? 1 : 0)
                        .scaleEffect(phase == .start ? 1 : 2.0)
                }
                animation: { phase in
                    Animation
                        .easeOut(duration: 2)
                        .repeatForever(autoreverses: false)
                    }
            
            Circle()
                .stroke(.purple, lineWidth: 5)
                .frame(width: size)
                .phaseAnimator(AnimationPhase.allCases, trigger: animate) { content, phase in
                    content
                        .opacity(phase == .start ? 1 : 0)
                        .scaleEffect(phase == .start ? 1 : 2.0)
                }
                animation: { phase in
                    Animation
                        .easeOut(duration: 2)
                        .repeatForever(autoreverses: false)
                        .delay(1)
                    }
        }
        .onAppear {
            animate.toggle()
        }
    }
}


#Preview {
    ComplicatedAnimation()
}
