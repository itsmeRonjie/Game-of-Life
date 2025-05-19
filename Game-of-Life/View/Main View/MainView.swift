//
//  ContentView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct MainView: View {
    @State private var boardModel: BoardModel = BoardModel(gridSize: 50)
    @State private var selectedDesign: DesignType = .tub
    @State private var swapXY: Bool = false
    @State private var currentImage: ImageResource = .mountain1
    @State private var showImage: Bool = true
    @State private var isPlaying: Bool = true

    @State private var timer: Timer?
    
    let MIN_SECONDS: Double = 0.01
    let MAX_SECONDS: Double = 3.0
    let MAX_SPEED: Double = 10.0
    var MAX_TIME: Double {
        MAX_SPEED / 2
    }
    
    var a: Double {
        (MIN_SECONDS - MAX_SECONDS) / MAX_SPEED
    }
    
    var speed: Double {
        1 / a * (MAX_TIME - MAX_SECONDS)
    }

    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                TitleView()
                
                Spacer()
                
                BoardView(
                    boardModel: $boardModel,
                    selectedDesign: $selectedDesign,
                    swapXY: $swapXY,
                    currentImage: $currentImage,
                    showImage: $showImage
                )
                
                Spacer()
                
                ControlView()
            }
            .padding()
        }
        .onAppear { startGame() }
        .onChange(of: speed) { _, newSpeed in
            // TODO: Reset Speed
        }
    }
    
    func startGame() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: 1 / speed,
            repeats: true,
            block: { _ in
                withAnimation {
                    if isPlaying {
                        boardModel.nextGeneration()
                    }
                }
            }
        )
    }
}

#Preview("Light Mode") {
    MainView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    MainView()
        .preferredColorScheme(.dark)
}
