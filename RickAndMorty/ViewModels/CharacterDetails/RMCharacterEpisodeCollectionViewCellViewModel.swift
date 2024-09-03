//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 02/09/2024.
//

import Foundation

protocol RMEpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    private var isFatching = false
    private var dataBlock: ((RMEpisodeDataRender) -> Void)?
    
    private var eposode: RMEpisode? {
        didSet {
            guard let model = eposode else {
                return
            }
            dataBlock?(model)
        }
    }
    
    // MARK: - Init
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    // MARK: - Public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFatching else {
            if let model = eposode {
                self.dataBlock?(model)
            }
            return
        }
        
        guard let url = episodeDataUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        isFatching = true
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.sync {
                    self?.eposode = model
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
