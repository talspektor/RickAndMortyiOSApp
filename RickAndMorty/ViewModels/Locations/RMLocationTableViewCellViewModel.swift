//
//  RmLocaitonTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 04/09/2024.
//

import Foundation

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
   
    private let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        location.name
    }
    
    public var type: String {
        "Type: \(location.type)" 
    }
    
    public var dimension: String? {
        location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue && lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
    
}
