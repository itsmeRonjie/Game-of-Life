//
//  BoardView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct BoardView: View {
    let gridSize = 50
    let color: Color = .red
    
    @Binding var boardModel: BoardModel
    @Binding var selectedDesign: DesignType
    @Binding var swapXY: Bool
    @Binding var currentImage: ImageResource
    @Binding var showImage: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let canvasSize = min(
                geometry.size.width,
                geometry.size.height
            )
            let cellSize = canvasSize / CGFloat(gridSize)
            ZStack {
                if showImage {
                    Image(currentImage)
                        .resizable()
                        .opacity(0.8)
                } else {
                    Color.black
                }
                
                CreatureGrid(
                    creatures: $boardModel.creatures,
                    gridSize: gridSize,
                    color: color
                )
                .onTapGesture { location in
                    let row = Int(location.y / cellSize)
                    let col = Int(location.x / cellSize)
                    
                    boardModel
                        .applyDesignPattern(
                            row: row,
                            col: col,
                            designType: selectedDesign,
                            swapXY: swapXY
                        )
                    
                }
            }
            .clipShape(.rect(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            }
            .frame(width: canvasSize, height: canvasSize)
            .frame(maxHeight: .infinity)
            .shadow(radius: 3)
        }
    }
}

#Preview {
    VStack {
        BoardView(
            boardModel: .constant(BoardModel(gridSize: 50)),
            selectedDesign: .constant(.tub),
            swapXY: .constant(false),
            currentImage: .constant(.mountain1),
            showImage: .constant(true)
        )
        
        BoardView(
            boardModel: .constant(BoardModel(gridSize: 50)),
            selectedDesign: .constant(.tub),
            swapXY: .constant(false),
            currentImage: .constant(.mountain1),
            showImage: .constant(false)
        )
    }.padding()
}
