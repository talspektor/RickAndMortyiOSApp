//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 04/09/2024.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var loacations: [RMLocation] = []
    
    private var cellViewModel: [String] = []
    
    // MARK: - Init
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.lisetLocationReqiest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        false
    }
}
