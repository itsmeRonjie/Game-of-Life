//
//  TitleView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct TitleView: View {
    var gradientColors: [Color] {
        [.gradColor1, .gradColor2, .gradColor3]
    }
    
    var body: some View {
        Text("Game of Life")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .shadow(
                color: .shadow,
                radius: 10,
                x: 0,
                y: 5
            )
    }
}

#Preview {
    TitleView()
}
