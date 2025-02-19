//
//  CustomContextMenu.swift
//  ChatScroll UI SwiftUI
//
//  Created by Maksim Zakharov on 19.02.2025.
//
import SwiftUI
import UIKit

// Custom Context Menu UIViewRepresentable
struct CustomContextMenu: UIViewRepresentable {
    let message: Message
    let onForward: () -> Void
    let onReply: () -> Void
    let onCopy: () -> Void
    let onDelete: () -> Void
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
        view.addInteraction(interaction)
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIContextMenuInteractionDelegate {
        let parent: CustomContextMenu
        
        init(_ parent: CustomContextMenu) {
            self.parent = parent
        }
        
        func contextMenuInteraction(
            _ interaction: UIContextMenuInteraction,
            configurationForMenuAtLocation location: CGPoint
        ) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(
                identifier: nil,
                previewProvider: { [weak self] in
                    guard let self = self else { return nil }
                    
                    let previewController = UIHostingController(
                        rootView: MessagePreviewView(message: self.parent.message)
                    )
                    previewController.view.backgroundColor = .white
                    
                    // Позволяем view самостоятельно определить свой размер
                    previewController.view.invalidateIntrinsicContentSize()
                    
                    // Размер контроллера будет определен автоматически на основе содержимого
                    let targetSize = previewController.sizeThatFits(in: UIView.layoutFittingExpandedSize)
                    previewController.preferredContentSize = targetSize
                    
                    return previewController
                },
                actionProvider: { [weak self] _ in
                    guard let self = self else { return nil }
                    
                    let forwardAction = UIAction(
                        title: "Переслать",
                        image: UIImage(systemName: "arrowshape.turn.up.right")
                    ) { _ in
                        self.parent.onForward()
                    }
                    
                    let replyAction = UIAction(
                        title: "Ответить",
                        image: UIImage(systemName: "arrowshape.turn.up.left")
                    ) { _ in
                        self.parent.onReply()
                    }
                    
                    let copyAction = UIAction(
                        title: "Копировать",
                        image: UIImage(systemName: "doc.on.doc")
                    ) { _ in
                        self.parent.onCopy()
                    }
                    
                    let deleteAction = UIAction(
                        title: "Удалить",
                        image: UIImage(systemName: "trash"),
                        attributes: .destructive
                    ) { _ in
                        self.parent.onDelete()
                    }
                    
                    return UIMenu(children: [forwardAction, replyAction, copyAction, deleteAction])
                }
            )
        }
        
        func contextMenuInteraction(
            _ interaction: UIContextMenuInteraction,
            previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration
        ) -> UITargetedPreview? {
            guard let sourceView = interaction.view else { return nil }
            
            let parameters = UIPreviewParameters()
            parameters.backgroundColor = .clear
            
            return UITargetedPreview(
                view: sourceView,
                parameters: parameters
            )
        }
    }
}
