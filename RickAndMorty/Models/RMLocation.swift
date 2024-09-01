//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Tal Spektor on 31/08/2024.
//

import Foundation

struct RMLocation: Codable {

    let id: Int
    let name: String
    let type: String
    let dimention: String
    let residents: [String]
    let url: String
    let created: String
}
