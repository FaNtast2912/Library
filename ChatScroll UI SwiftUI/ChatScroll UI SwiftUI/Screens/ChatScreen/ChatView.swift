//
//  ContentView.swift
//  ChatScroll UI SwiftUI
//
//  Created by Maksim Zakharov on 17.02.2025.
//

import SwiftUI
import UIKit

// Chat View
struct ChatView: View {
    @State private var messages: [Message] = [
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
        Message(text: "Привет!", isFromCurrentUser: false, timestamp: Date()),
        Message(text: "Как дела?", isFromCurrentUser: true, timestamp: Date()),
    ]
    @State private var numberOfMessages: String = "1"
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(messages.reversed()) { message in
                            MessageCell(message: message)
                                .id(message.id) // Важно для скроллинга
                        }
                    }
                }
            }
            .scaleEffect(x: -1, y: -1)
            
            HStack {
                TextField("Количество сообщений", text: $numberOfMessages)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 100)
                
                Button("Добавить сообщения") {
                    addTestMessages()
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
    
    private func scrollToBottom() {
        guard let lastMessage = messages.last else { return }
        withAnimation {
            scrollProxy?.scrollTo(lastMessage.id, anchor: .bottom)
        }
    }
    
    private func addTestMessages() {
        guard let count = Int(numberOfMessages), count > 0 else { return }
        
        for i in 0..<count {
            let newMessage = Message(
                text: "Тестовое сообщение #\(messages.count + 1) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut fringilla accumsan rutrum. Integer ullamcorper tempor vulputate. Fusce semper cursus nulla id aliquet. Etiam eu sapien quis eros volutpat egestas non eu turpis. Sed elementum, magna suscipit accumsan aliquet, libero nunc tempus enim, ut condimentum diam risus sit amet neque. Vestibulum vel enim posuere purus pellentesque laoreet eget nec ex. Sed iaculis sodales mi vel egestas. Donec non eros tellus.",
                isFromCurrentUser: i % 2 == 0,
                timestamp: Date()
            )
            messages.append(newMessage)
        }
        
        // Прокручиваем к последнему сообщению после добавления
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            scrollToBottom()
        }
    }
}


// Preview
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
