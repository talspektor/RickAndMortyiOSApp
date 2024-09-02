//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Tal Spektor on 01/09/2024.
//

import Foundation

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case `unowned` = "unknown"
}
