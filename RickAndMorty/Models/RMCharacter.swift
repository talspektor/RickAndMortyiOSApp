//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Tal Spektor on 31/08/2024.
//

import Foundation

struct RMCharacter {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

