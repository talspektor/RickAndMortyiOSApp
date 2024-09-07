//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 05/09/2024.
//

import Foundation

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
        
    // MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func executeSearch() {
        // Create request based on filters
        // Send API call
        // Notify view of results
    }
    
    public func set(query text: String) {
        searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void
    ) {
        self.optionMapUpdateBlock = block
    }
}
