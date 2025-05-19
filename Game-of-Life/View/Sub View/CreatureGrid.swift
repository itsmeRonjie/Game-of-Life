//
//  CreatureGrid.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct CreatureGrid: View {
    @Binding var creatures: [[Int]]
    let gridSize: Int
    let color: Color
    
    var body: some View {
        Canvas {
            context,
            size in
            for row in 0..<gridSize {
                for col in 0..<gridSize {
                    let cellSize = size.width / CGFloat(gridSize)
                    let rect = CGRect(
                        x: CGFloat(col) * cellSize,
                        y: CGFloat(row) * cellSize,
                        width: cellSize,
                        height: cellSize
                    )
                    
                    if creatures[row][col] == 1 {
                        context.fill(
                            Path(rect),
                            with: .color(color)
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var creatures: [[Int]] = (0..<25)
        .map { _ in
            (0..<25).map { _ in
                Int.random(in: 0...1)
            }
        }
    
    CreatureGrid(
        creatures: .constant(creatures),
        gridSize: 25,
        color: .red
    ).padding()
}
