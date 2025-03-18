//
//  TwoAnimations.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct TwoAnimations: View {
    @State var inFinalState = false
    
    var body: some View {
        VStack {
            Text("Привет,")
                .font(.title)
                .foregroundStyle(inFinalState ? .green : .red)
                .offset(x: inFinalState ? 0 : -UIScreen.main.bounds.size.width/2)
                .opacity(inFinalState ? 1 : 0)
            Text("Практикум!")
                .font(.title)
                .foregroundStyle(inFinalState ? .green : .red)
                .offset(x: inFinalState ? 0 : UIScreen.main.bounds.size.width/2)
                .opacity(inFinalState ? 1 : 0)
        }
        .onAppear{
            withAnimation (.linear(duration: 1)){
                inFinalState = true
            }
        }
    }
}

#Preview {
    TwoAnimations()
}
