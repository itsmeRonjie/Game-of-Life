//
//  ContentView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                TitleView()
                
                Spacer()
                
                BoardView()
                
                Spacer()
                
                ControlView()
            }
            .padding()
        }
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
