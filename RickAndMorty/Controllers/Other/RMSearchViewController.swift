//
//  RMRMSearchViewController.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 03/09/2024.
//

import UIKit

// Dynamoic search option view
// Render resultes
// Rnder no results zero state
// Searching / API call

/// Configerable controller to search
final class RMSearchViewController: UIViewController {
        
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character // name | status | gender
            case episod // allow name
            case location // name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Chatracters"
                case .location:
                    return "Search Locations"
                case .episod:
                    return "Search Episodes"
                }
            }
        }
        let type: `Type`
    }
    
    private let config: Config
    
    // MARK: - Init
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground

    }

}
