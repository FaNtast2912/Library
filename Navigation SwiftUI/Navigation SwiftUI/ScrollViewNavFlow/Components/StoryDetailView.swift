//
//  StoryDetailView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct StoryDetailView: View {
    
    var imageName: String
    
    var body: some View {
        Text("картинка номер \(imageName)")
    }
}

#Preview {
    StoryDetailView(imageName: "Имя")
}
