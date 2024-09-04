//
//  RMAPICachManager.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 03/09/2024.
//

import Foundation

/// Manages in memory session scope API caches
final class RMAPICachManager {
    
    // API URL: Data
    
    private var cacheDictionary: [
        RMEndpoint: NSCache<NSString, NSData>
    ] = [:]
    
    private var cache = NSCache<NSString, NSData>()
    
    init() {
        setUpCache()
    }
    
    // MARK: - Public
    
    public func cacheResponse(for enpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[enpoint], let url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for enpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[enpoint], let url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }

    
    // MARK: - Private
    
    private func setUpCache() {
        RMEndpoint.allCases.forEach { enpoint in
            cacheDictionary[enpoint] = NSCache<NSString, NSData>()
        }
    }
}
