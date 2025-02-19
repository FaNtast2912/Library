//
//  Message.swift
//  ChatScroll UI SwiftUI
//
//  Created by Maksim Zakharov on 19.02.2025.
//
import Foundation

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isFromCurrentUser: Bool
    let timestamp: Date
}
