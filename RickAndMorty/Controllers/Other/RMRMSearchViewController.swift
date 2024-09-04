//
//  RMRMSearchViewController.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 03/09/2024.
//

import UIKit

/// Configerable controller to search
final class RMRMSearchViewController: UIViewController {

    struct Config {
        enum `Type` {
            case character
            case episod
            case location
        }
        let type: `Type`
    }
    
    private let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground

    }

}
