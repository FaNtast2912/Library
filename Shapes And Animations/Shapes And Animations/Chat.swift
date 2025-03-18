//
//  Chat.swift
//  Shapes And Animations
//
//  Created by Maksim Zakharov on 09.03.2025.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .top) {
                Image(systemName: "figure.dance")
                    .frame(width: 50, height: 50)
                    .background(Color.orange)
                    .clipShape(Circle())
                Text("Привет!")
                    .padding()
                    .background(Color.white)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 15), style: .continuous))
                Spacer()
            }
            HStack {
                Spacer()
                Text("И тебе привет!")
                    .padding()
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 15, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0), style: .continuous)
                    )
            }
            HStack (alignment: .top) {
                Image(systemName: "figure.dance")
                    .frame(width: 50, height: 50)
                    .background(Color.orange)
                    .clipShape(Circle())
                VStack {
                    HStack {
                        Text("Как дела?")
                            .padding()
                            .background(Color.white)
                            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 15), style: .continuous))
                        
                        Spacer()
                    }
                    HStack {
                        Text("У нас сегодня дождь.")
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color.teal, lineWidth: 1))
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .background(
            LinearGradient(colors: [Color.teal.opacity(0.5), Color.teal.opacity(0.2)],
                           startPoint: .top,
                           endPoint: .bottom))
    }
}

#Preview {
    Chat()
}
