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
    @State private var speed: Double = 200.0
    @State private var isShown: Bool = false
    
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
                
                if isShown {
                    DesignSelectionView(
                        selectedDesign: $selectedDesign,
                        swapXY: $swapXY
                    )
                }
                
                ControlView(
                    showImage: $showImage,
                    currentImage: $currentImage,
                    speed: $speed,
                    isPlaying: $isPlaying,
                    isShown: $isShown,
                    boardModel: $boardModel
                )
            }
            .padding()
        }
        .onAppear { startGame() }
        .onChange(of: speed) { _, newSpeed in
            resetSpeed()
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
    
    func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetSpeed() {
        stopGame()
        startGame()
    }
    
    func resetGame() {
        boardModel.clearBoard()
        stopGame()
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
