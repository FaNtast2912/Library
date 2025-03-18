//
//  SimpleAnimation.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 18.03.2025.
//

import SwiftUI

struct SimpleAnimation: View {
    @State var viewInFinalState = false
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(viewInFinalState ? .orange : .blue)
                Text("Привет, Практикум!")
            }
            .padding()
            .opacity(viewInFinalState ? 1 : 0)
            .scaleEffect(viewInFinalState ? 2.0 : 1.0)
            .animation(.easeInOut(duration: 1), value: viewInFinalState)
            
            Button {
                self.viewInFinalState = true
                
            } label: {
                Text("СТАРТ")
                    .font(.title)
            }
            .opacity(viewInFinalState ? 0 : 1)
        }
    }
}


#Preview {
    SimpleAnimation()
}
