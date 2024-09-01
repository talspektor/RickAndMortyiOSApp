//
//  RMService.swift
//  RickAndMorty
//
//  Created by Tal Spektor on 01/09/2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Private constructor
    private init() {
        
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data of error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
