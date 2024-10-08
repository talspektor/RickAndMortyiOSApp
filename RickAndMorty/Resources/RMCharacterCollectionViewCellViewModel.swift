//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 02/09/2024.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(compaletion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to image manager
        guard let url = characterImageUrl else {
            compaletion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(url, compaletion: compaletion)
    }
    
    // MARK: - Hashable
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
}
