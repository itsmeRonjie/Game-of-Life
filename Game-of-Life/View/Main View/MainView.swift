//
//  ContentView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("Game of Life")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            BoardView()
            
            Spacer()
            
            ControlView()
        }
        .padding()
    }
}

#Preview {
    MainView()
}
