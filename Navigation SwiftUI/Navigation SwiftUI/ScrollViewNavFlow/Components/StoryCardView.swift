//
//  StoryCardView.swift
//  Navigation SwiftUI
//
//  Created by Maksim Zakharov on 16.02.2025.
//

import SwiftUI

struct StoryCardView: View {
    let story: Story
    private let storySize = CGSize(width: 92, height: 140)
    private let cornerRadius: CGFloat = 16

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(story.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: storySize.width, height: storySize.height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 4
                        )
                )

            VStack(alignment: .leading, spacing: 0) {
                Text(story.title)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 12)
            }
            .background(
                LinearGradient(
                    colors: [.clear, .black.opacity(0.6)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .frame(width: storySize.width, height: storySize.height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    StoryCardView(story: Story(imageName: "1", title: "Машинист"))
}
