//
//  DesignSelectionView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/20/25.
//

import SwiftUI

struct DesignSelectionView: View {
    @Binding var selectedDesign: DesignType
    @Binding var swapXY: Bool
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.interpolatingSpring(stiffness: 200, damping: 15)) {
                    swapXY.toggle()
                }
            } label: {
                Image(systemName: "arrow.left.and.right")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.gray.gradient, in: Circle())
                    .shadow(radius: 3)
                    .rotationEffect(.degrees(swapXY ? 90 : 0))
            }
            
            // Design Selection ScrollView
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(DesignType.allCases, id: \.self) { design in
                        
                        Button {
                            withAnimation {
                                selectedDesign = design
                            }
                        } label: {
                            DesignButtonView(
                                design: design,
                                color: color(for: design),
                                selectedDesign: selectedDesign
                            )
                        }
                    }
                }.padding(.vertical, 5)
                    .padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
        }
        .shadow(radius: 8)
    }
    
    private func color(for design: DesignType) -> Color {
        if DesignType.stillLifeDesign.contains(design) {
            .blue
        } else if DesignType.oscillatorsDesign.contains(design) {
            .green
        } else {
            .red
        }
    }
}

#Preview {
    DesignSelectionView(
        selectedDesign: .constant(.tub),
        swapXY: .constant(false)
    )
}
