//
//  RMSarchReasultViewMdel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 07/09/2024.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
