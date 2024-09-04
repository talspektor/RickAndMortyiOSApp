//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 04/09/2024.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    var id = UUID()
    
    public let type: RMSettingsOptions
    public let onTapHandler: (RMSettingsOptions) -> Void
    
    // MARK: - Init
    
    init(type: RMSettingsOptions, onTapHandler: @escaping (RMSettingsOptions) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    // MARK: - Public
    
    public var image: UIImage? {
        type.iconImage
    }
    
    public var title: String {
        type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        type.iconContainerColor
    }
}
