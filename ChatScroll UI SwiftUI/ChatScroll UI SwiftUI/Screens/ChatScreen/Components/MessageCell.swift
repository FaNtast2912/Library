//
//  MessageCell.swift
//  ChatScroll UI SwiftUI
//
//  Created by Maksim Zakharov on 19.02.2025.
//

import SwiftUI

// Updated MessageCell
struct MessageCell: View {
    let message: Message
    
    var body: some View {
        HStack {
            if !message.isFromCurrentUser {
                Spacer()
            }
            
            VStack(alignment: message.isFromCurrentUser ? .trailing : .leading) {
                Text(message.text)
                    .padding(12)
                    .background(message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.3))
                    .foregroundColor(message.isFromCurrentUser ? .white : .black)
                    .cornerRadius(16)
                
                Text(formatDate(message.timestamp))
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 4)
            }
            .overlay(
                CustomContextMenu(
                    message: message,
                    onForward: {
                        // Действие для пересылки
                    },
                    onReply: {
                        // Действие для ответа
                    },
                    onCopy: {
                        // Действие для копирования
                    },
                    onDelete: {
                        // Действие для удаления
                    }
                )
            )
            .scaleEffect(x: -1, y: -1)
            
            
            if message.isFromCurrentUser {
                Spacer()
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


#Preview {
    MessageCell(message: Message(text: "Hello!", isFromCurrentUser: true, timestamp: Date()))
}
