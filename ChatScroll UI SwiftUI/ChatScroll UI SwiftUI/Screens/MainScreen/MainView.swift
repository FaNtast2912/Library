//
//  MainView.swift
//  ChatScroll UI SwiftUI
//
//  Created by Maksim Zakharov on 19.02.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isNavigatingToChat = false
    @State private var chat: ChatView? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button(action: {
                    if chat == nil {
                        chat = ChatView()
                    }
                    isNavigatingToChat = true
                }) {
                    Text("Перейти к чату")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("Главная")
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(
                    destination: chat.map { AnyView($0) } ?? AnyView(EmptyView()),
                    isActive: $isNavigatingToChat
                ) {
                    EmptyView()
                }
            )
            // Предварительно создаем ChatView
            .onAppear {
                if chat == nil {
                    chat = ChatView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
