//
//  ControlButtonType.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/20/25.
//

import Foundation

enum ControlButtonType {
    case playPause(isPlaying: Bool)
    case refresh, clear, toggleImage, changeImage, toggleVisibility(isHidden: Bool)
    
    var systemImage: String {
        switch self {
            
        case .playPause(isPlaying: let isPlaying):
            isPlaying ? "pause" : "play"
        case .refresh:
            "arrow.counterclockwise"
        case .clear:
            "clear"
        case .toggleImage:
            "photo.on.rectangle"
        case .changeImage:
            "arrow.triangle.2.circlepath"
        case .toggleVisibility(isHidden: let isHidden):
            isHidden ? "ladybug" : "ladybug.slash"
        }
    }
}
