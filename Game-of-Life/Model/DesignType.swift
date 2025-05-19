//
//  DesignType.swift
//  Game-of-Life
//
//  Created by Ronjie Diafante Man-on on 5/19/25.
//

import Foundation

enum DesignType: String, CaseIterable {
    case block, beehive, loaf, boat, tub
    case blinker, toad, beacon, pulsar, pentaDecathlon
    case glider, LWSS, MWSS, HWSS
    
    var offsetDesign: [(x: Int, y: Int)] {
        switch self {
            
        case .block:
            return [
                (0, -1),
                (1, -1),
                (0, 0),
                (1, 0)
            ]
            
        case .beehive:
            return [
                (-1, -1),
                (0, -1),
                (-2, 0),
                (1, 0),
                (-1, 1),
                (0, 1)
            ]
            
        case .loaf:
            return [
                (-1, -1),
                (0, -1),
                (-2, 0),
                (1, 0),
                (-1, 1),
                (1, 1),
                (0, 2)
            ]
            
        case .boat:
            return [
                (-1, -1),
                (0, -1),
                (-1, 0),
                (1, 0),
                (0, 1)
            ]
            
        case .tub:
            return [
                (0, -1),
                (-1, 0),
                (1, 0),
                (0, 1)
            ]
            
        case .blinker:
            return [
                (0, -1),
                (0, 0),
                (0, 1)
            ]
            
        case .toad:
            return [
                (1, -2),
                (-1, -1),
                (2, -1),
                (-1, 0),
                (2, 0),
                (0, 1)
            ]
            
        case .beacon:
            return [
                (-2, -2),
                (-1, -2),
                (-2, -1),
                (-1, -1),
                (0, 0),
                (1, 0),
                (0, 1),
                (1, 1)
            ]
            
        case .pulsar:
            return [
                (-4, -6),
                (-3, -6),
                (-2, -6),
                (2, -6),
                (3, -6),
                (4, -6),
                (-6, -4),
                (-1, -4),
                (1, -4),
                (6, -4),
                (-6, -3),
                (-1, -3),
                (1, -3),
                (6, -3),
                (-6, -2),
                (-1, -2),
                (1, -2),
                (6, -2),
                (-4, -1),
                (-3, -1),
                (-2, -1),
                (2, -1),
                (3, -1),
                (4, -1),
                (-4, 1),
                (-3, 1),
                (-2, 1),
                (2, 1),
                (3, 1),
                (4, 1),
                (-6, 2),
                (-1, 2),
                (1, 2),
                (6, 2),
                (-6, 3),
                (-1, 3),
                (1, 3),
                (6, 3),
                (-6, 4),
                (-1, 4),
                (1, 4),
                (6, 4),
                (-4, 6),
                (-3, 6),
                (-2, 6),
                (2, 6),
                (3, 6),
                (4, 6)
            ]
            
        case .pentaDecathlon:
            return [
                (-1, -4),
                (0, -4),
                (1, -4),
                (-1, -3),
                (1, -3),
                (-1, -2),
                (0, -2),
                (1, -2),
                (-1, -1),
                (0, -1),
                (1, -1),
                (-1, 0),
                (0, 0),
                (1, 0),
                (-1, 1),
                (0, 1),
                (1, 1),
                (-1, 2),
                (1, 2),
                (-1, 3),
                (0, 3),
                (1, 3)
            ]
            
        case .glider:
            return [
                (0, -1),
                (1, 0),
                (-1, 1),
                (0, 1),
                (1, 1)
            ]
            
        case .LWSS:
            return [
                (0, -1),
                (1, -1),
                (-2, 0),
                (-1, 0),
                (1, 0),
                (2, 0),
                (-2, 1),
                (-1, 1),
                (0, 1),
                (1, 1),
                (-1, 2),
                (0, 2)
            ]
            
        case .MWSS:
            return [
                (-2, -2),
                (-1, -2),
                (0, -2),
                (1, -2),
                (2, -2),
                (-3, -1),
                (2, -1),
                (2, 0),
                (-3, 1),
                (1, 1),
                (-1, 2)
            ]
            
        case .HWSS:
            return [
                (-3, -2),
                (-2, -2),
                (-1, -2),
                (0, -2),
                (1, -2),
                (2, -2),
                (-4, -1),
                (2, -1),
                (2, 0),
                (-4, 1),
                (1, 1),
                (-2, 2),
                (-1, 2)
            ]
        }
    }
    
    static let stillLifeDesign: [DesignType] = [.block, .beehive, .loaf, .boat, .tub]
    static let oscillatorsDesign: [DesignType] = [.blinker, .toad, .beacon, .pulsar, .pentaDecathlon]
    static let spaceShipsDesign: [DesignType] = [.glider, .LWSS, .MWSS, .HWSS]
}
