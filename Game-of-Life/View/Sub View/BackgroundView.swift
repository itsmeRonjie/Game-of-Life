//
//  BackgroundView.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color("bgColor")
            .opacity(0.5)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
