//
//  ControlView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct ControlView: View {
    @Binding var showImage: Bool
    @Binding var currentImage: ImageResource
    @Binding var speed: Double
    @Binding var isPlaying: Bool
    @Binding var isShown: Bool
    @Binding var boardModel: BoardModel
    
    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 1...300,
                step: 0.5
            )
            
            HStack {
                ButtonView(
                    name: ControlButtonType.playPause(isPlaying: isPlaying).systemImage,
                    action: { isPlaying.toggle() }
                )
                
                ButtonView(
                    name: ControlButtonType.refresh.systemImage,
                    action: { boardModel.randomBoard() }
                )
                
                ButtonView(
                    name: ControlButtonType.clear.systemImage,
                    action: { boardModel.clearBoard() }
                )
                
                ButtonView(
                    name: ControlButtonType.toggleImage.systemImage,
                    action: { showImage.toggle() }
                )
                
                ButtonView(
                    name: ControlButtonType.changeImage.systemImage,
                    action: {
                        withAnimation {
                            currentImage = BackgroundImages.all
                                .randomElement() ?? .mountain1
                        }
                    }
                )

                ButtonView(
                    name: ControlButtonType
                        .toggleVisibility(isHidden: isShown)
                        .systemImage,
                    action: {
                        withAnimation {
                            isShown.toggle()
                        }
                    }
                )
            }
        }
    }
}

struct ButtonView: View {
    let name: String
    let font: Font = Font.headline
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .font(font)
                .foregroundStyle(.foreground)
                .padding(10)
                .background(Circle().fill(.background.opacity(0.2)))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.bg.ignoresSafeArea()
        
        ControlView(
            showImage: .constant(true),
            currentImage: .constant(.autumn1),
            speed: .constant(100.0),
            isPlaying: .constant(true),
            isShown: .constant(true),
            boardModel: .constant(BoardModel(gridSize: 50))
        )
    }
}
