//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Tal Spektor on 01/09/2024.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
